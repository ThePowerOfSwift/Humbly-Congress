//
//  PoliticianTableViewController.swift
//  Humbly Congress
//
//  Created by Parankush Bhardwaj on 3/31/17.
//  Copyright © 2017 Parankush Bhardwaj. All rights reserved.
//

import UIKit
import MapKit
import EventKit
import SafariServices
import CoreLocation


class FirstEventCell: UITableViewCell, SFSafariViewControllerDelegate  {
    
    @IBOutlet var title: UILabel!
    
    
    @IBOutlet var details: UILabel!
    
    
    @IBOutlet var when: UIButton!
    
    
    @IBOutlet var whereEvent: UIButton!
    
    
    @IBOutlet var website: UIButton!
    
    
    
    @IBAction func segueToMaps(_ sender: UIButton) {
        
        CLGeocoder().geocodeAddressString((whereEvent.titleLabel!.text)!, completionHandler: {(placemarks, error) in
            
            if error != nil {
            } else if placemarks!.count > 0 {
                let placemark = placemarks![0]
                let location = placemark.location
                let coords = location!.coordinate
                let coordinate = CLLocationCoordinate2DMake(coords.latitude,coords.longitude)
                let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
                mapItem.name = self.whereEvent.titleLabel!.text
                mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
                
            }
        })
    }
    
    //below function will be used for calendar button action
    
    func addEventToCalendar(title: String, description: String?, startDate: Date, endDate: Date, location: String, completion: ((_ success: Bool, _ error: NSError?) -> Void)? = nil) {
        
        let eventStore = EKEventStore()
        
        eventStore.requestAccess(to: .event, completion: { (granted, error) in
            if (granted) && (error == nil) {
                let event = EKEvent(eventStore: eventStore)
                event.title = title
                event.startDate = startDate as Date
                event.endDate = endDate as Date
                event.location = location
                event.notes = description
                event.calendar = eventStore.defaultCalendarForNewEvents
                do {
                    try eventStore.save(event, span: .thisEvent)
                } catch let e as NSError {
                    completion?(false, e)
                    return
                }
                completion?(true, nil)
            } else {
                completion?(false, error as NSError?)
            }
        })
    }

    
    
    @IBAction func addEventToCalendar(_ sender: UIButton) {
        
        //used to format date
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d, yyyy"
        let dateToFormat = when.currentTitle!
        
        let startDate = formatter.date(from: dateToFormat)
        
        addEventToCalendar(title: self.title.text!, description: self.details.text!, startDate: startDate!, endDate: startDate!, location: whereEvent.titleLabel!.text!)
        
        sender.setTitle("Event Added!", for: .normal)
        //sender.setTitleColor(UIColor.green, for:.normal)

    }
    
    
    
    @IBAction func segueToSafari(_ sender: UIButton) {
        
        if (website.titleLabel?.text != nil) {
            
            UIApplication.shared.open(URL(string: (website.titleLabel?.text)!)!)
        }
        
        
    }
    
    
    
    
    
    
}

class EventTableViewController: UITableViewController, CLLocationManagerDelegate {

    
    let locationManager = CLLocationManager()
    
    var userLocation = CLLocationManager().location
    
    
    var zipcode: String = "33328"
    
    typealias ZipcodeCompletionBlock = (String?) -> Void
    
    func getTableInfo(completionBlock: @escaping ZipcodeCompletionBlock) {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.requestAlwaysAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        CLGeocoder().reverseGeocodeLocation(userLocation!, completionHandler: {(placemarks, error) -> Void in
            if error != nil {
                print("Reverse geocoder failed with error" + error!.localizedDescription)
                completionBlock(nil)
            } else if placemarks!.count > 0 {
                let pm = placemarks![0]
                self.zipcode = pm.postalCode!
                completionBlock(self.zipcode)
            } else {
                print("Problem with the data received from geocoder")
                completionBlock(nil)
            }
        })
        
    }
    
    
    
    var events = [" "," "," ", " "]
    
    var descriptions = [" "," "," ", " "]
    
    var dates = [" "," "," ", " "]
    
    var locations = [" "," "," ", " "]
    
    var urls = [" "," "," ", " "]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.locationManager.location != nil {
            userLocation = CLLocationManager().location!
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    
    
    @IBOutlet var eventsTableView: UITableView!
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
        
        
        //load location before table
        
        if (userLocation != nil) {
            
            self.getTableInfo { zipcode in
                
                //grab user's location
                let postalCode = Int(zipcode!)
                let eventsChecker = eventChecker()
                
                //go to eventChecker to load events based off that zipcode
                eventsChecker.getEvent(zipcode: postalCode!, title: self.events, date: self.dates, descriptions: self.descriptions, location: self.locations, url: self.urls)
                
                let eventName = eventsChecker.eventName
                
                let dateOfEvent = eventsChecker.evntDate
                
                let evntDescription = eventsChecker.evntDescription
                
                let evntLocation = eventsChecker.evntLocation
                
                let evntURL = eventsChecker.evntURL
                
                
                //bottom three are for the cell, to parse thorough the array, configuring each element in its respective cell
                
                let eventTitle = eventName[indexPath.row]
                
                let eventDate = dateOfEvent[indexPath.row]
                
                let eventLocation = evntLocation[indexPath.row]
                
                let eventURL = evntURL[indexPath.row]
                
                let eventDescription = evntDescription[indexPath.row]
                
                //configure the cell
                
                if let eventCell = cell as? FirstEventCell {
                    
                    eventCell.title?.text = eventTitle
                    
                    eventCell.details?.text = eventDescription
                    
                    eventCell.when.setTitle(eventDate, for:.normal)
                    
                    eventCell.whereEvent?.setTitle(eventLocation, for:.normal)
                    
                    eventCell.website?.setTitle(eventURL, for:.normal)
                }
                
            }
            
        }
        
        return cell
        
    }
    
}
