//
//  eventChecker.swift
//  Humbly Congress
//
//  Created by Parankush Bhardwaj on 3/31/17.
//  Copyright © 2017 Parankush Bhardwaj. All rights reserved.
//

import Foundation

import UIKit

class eventChecker: FirstEventCell {
    
    var postalCode: Int = 00000
    
    
    //these bottom six are for the event table
    
    var eventName = [" "," "," ", " "]
    
    var evntDate = [" "," "," ", " "]
    
    var evntDescription = [" "," "," ", " "]
    
    var evntLocation = [" "," "," ", " "]
    
    var evntURL = [" "," "," ", " "]
    
    var datePassed = false
    
    
    
    func checkIfEventPassed(event: String) {
        
        
        let formatter = DateFormatter()
        formatter.dateFormat  = "EEEE, MMMM d, yyyy"
        
        
        let dateOfTheEvent = event
        
        let todayAsDate = Date()
        let today = formatter.string(from: todayAsDate)
        
        let formattedDateOfEvent = formatter.date(from: dateOfTheEvent)
        let formattedVersionOfToday = formatter.date(from: today)
        
        if formattedDateOfEvent! < formattedVersionOfToday! {
            datePassed = true
        }
        
    }
    
    
    
    
    
    
    func getEvent(zipcode: Int, title: [String], date: [String], descriptions: [String], location: [String], url: [String]) {
        
        postalCode = zipcode
        
        eventName = title
        
        evntDate = date
        
        evntDescription = descriptions
        
        evntLocation = location
        
        evntURL = url
        
        
        //order of if-states is from west to east
        
        
        //Hawaii
        if (96700 ... 96899).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            
            //Alaska
        else if (99500 ... 99999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Oregon
        else if (97000 ... 97999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Washington
        else if (98000 ... 99499).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //California
        else if (90000 ... 96199).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Nevada
        else if (88900 ... 89999).contains(postalCode) {
            
            eventName[0] = "Chair Town Hall"
            evntDescription[0] = "Hosted by Senator Dean Heller"
            evntLocation[0] = "2171 E William St, Carson City, NV 89701"
            evntURL[0] = "www.apple.com"
            evntDate[0] = "Sunday, April 2, 2017"
            
        }
            //Arizona
        else if (85000 ... 86999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            
            //Utah
        else if (84000 ... 84999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Idaho
        else if (83200 ... 83999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Wyoming
        else if (82000 ... 83199).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Colorado
        else if (80000 ... 81999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //New Mexico
        else if (87000 ... 88499).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Montana
        else if (59000 ... 59999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //North Dakota
        else if (58000 ... 58999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //South Dakota
        else if (57000 ... 57999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Minnesota
        else if (55000 ... 56799).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Iowa
        else if (50000 ... 52999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Wisconson
        else if (50000 ... 52999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Nebraska
        else if (68000 ... 69999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Kansas
        else if (66000 ... 67999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Missouri
        else if (63000 ... 65999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Illinois
        else if (60000 ... 62999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Oklahoma
        else if (73000 ... 74999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Texas
        else if (75000 ... 79999).contains(postalCode) || (56900 ... 56999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Liousiana
        else if (70000 ... 71599).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Arkansas
        else if (71600 ... 72999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Michigan
        else if (48000 ... 49999).contains(postalCode){
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Indiana
        else if (46000 ... 47999).contains(postalCode){
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Ohio
        else if (43000 ... 45999).contains(postalCode){
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Kentucky
        else if (40000 ... 42999).contains(postalCode){
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Ten-I-see
        else if (37000 ... 38599).contains(postalCode){
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Mississippi
        else if (38600 ... 39799).contains(postalCode){
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Alabama
        else if (35000 ... 36999).contains(postalCode){
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Georgia
        else if (30000 ... 31999).contains(postalCode) || (39800 ... 39999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Florida
        else if (32000 ... 34999).contains(postalCode){
            
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Ron DeSantis"
            evntLocation[0] = "600 S Clyde Morris Blvd, Daytona Beach, FL 32114"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Mon, Apr 17, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Ted Yoho"
            evntLocation[1] = "1001 SE 12th St, Gainesville, FL 32641"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Tuesday, February 28, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Ted Yoho"
            evntLocation[2] = "466 Madison Ave, Orange Park, FL 32065"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Saturday, April 8, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Ted Yoho"
            evntLocation[3] = "2509 Crill Ave #100, Palatka, FL 32177"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Tuesday, April 11, 2017"
        }
            //South Carolina
        else if (29000 ... 29999).contains(postalCode){
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //North Carolina
        else if (27000 ... 28999).contains(postalCode){
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Virginia
        else if (22000 ... 24699).contains(postalCode) || (20100 ... 20199).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //West Virginia
        else if (24600 ... 26999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
            //Maryland
        else if (20600 ... 21999).contains(postalCode) {
            eventName.append(" ")
            evntDescription.append(" ")
            evntLocation.append(" ")
            evntURL.append(" ")
            evntDate.append(" ")
        }
    }
    
}
