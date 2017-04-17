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
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Brian Schatz"
            evntLocation[0] = "3140 Waialae Ave, Honolulu, HI 96816"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Mon, Apr 17, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Brian Schatz"
            evntLocation[1] = "Sciences and Technology, W Lanikaula St, Hilo, HI 96720"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Wed, April 18, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Tulsi Gabbard"
            evntLocation[2] = "165 Kaiholu St, Kailua, HI 96734"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Sat, Apr 15, 2017 "
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Colleen Hanabusa"
            evntLocation[3] = "2062 S King St, Honolulu, HI 96826"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Sat, Apr 22, 2017"

        }
            
            //Alaska
        else if (99500 ... 99999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Brian Schatz"
            evntLocation[0] = "3140 Waialae Ave, Honolulu, HI 96816"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Mon, Apr 17, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Brian Schatz"
            evntLocation[1] = "Sciences and Technology, W Lanikaula St, Hilo, HI 96720"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Wed, April 18, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Tulsi Gabbard"
            evntLocation[2] = "165 Kaiholu St, Kailua, HI 96734"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Sat, Apr 15, 2017 "
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Colleen Hanabusa"
            evntLocation[3] = "2062 S King St, Honolulu, HI 96826"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Sat, Apr 22, 2017"
        }
            //Oregon
        else if (97000 ... 97999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Ron Wyden"
            evntLocation[0] = "210 Boardman Ave NE, Boardman, OR 97818"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Sat, April 22, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Ron Wyden"
            evntLocation[1] = "708 K Ave, La Grande, OR 97850"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Sat, April 22, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Ron Wyden"
            evntLocation[2] = "102 E 1st St, Joseph, OR 97846"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Sun, Apr 23, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Ron Wyden"
            evntLocation[3] = "120 S Main St, Milton-Freewater, OR 97862"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Sun, Apr 23, 2017"
        }
            //Washington
        else if (98000 ... 99499).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Denny Heck"
            evntLocation[0] = "4500 Steilacoom Blvd SW, Lakewood, WA 98499"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Tue, April 18, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Pramila Jayapal"
            evntLocation[1] = "14700 6th Ave SW, Burien, WA 98166"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Thu, April 20, 2017"
            
            eventName[2] = "Empty Chair Town Hall"
            evntDescription[2] = "Hosted by Jaime Herrera Beutler "
            evntLocation[2] = "1933 Fort Vancouver Way, Vancouver, WA 98663"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Thu, April 20, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Suzan Delbene"
            evntLocation[3] = "314 N 9th St, Mt Vernon, WA 98273"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Fri, Apr 21, 2017"

        }
            //California
        else if (90000 ... 96199).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by John Garamendi at Fairfield Senior Center at 1:30 PM"
            evntLocation[0] = "1200 Civic Center Dr, Fairfield, CA 94533"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Tue, May 09, 2017 "
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Ted Lieu at Redondo Beach Performing Arts Center at 7 PM"
            evntLocation[1] = "1935 Manhattan Beach Blvd, Redondo Beach, CA 90278"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Mon, April 24, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Ro Khanna at Newark Memorial High School at 1 PM"
            evntLocation[2] = "39375 Cedar Blvd, Newark, CA 94560"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Sun, April 23, 2017"
            
            eventName[3] = "Office Hours"
            evntDescription[3] = "Hosted by Ami Bera at SPL-Franklin Branch at 10 AM"
            evntLocation[3] = "10055 Franklin High Rd, Elk Grove, CA 95757"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Tue, May 30, 2017"

        }
            //Nevada
        else if (88900 ... 89999).contains(postalCode) {
            
            eventName[0] = "Chair Town Hall"
            evntDescription[0] = "Hosted by Mark Amodei"
            evntLocation[0] = "4590 S Virginia St, Reno, NV 89502"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Mon, April 17, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Dean Heller "
            evntLocation[1] = "4590 S Virginia St, Reno, NV 89502"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Mon, April 17, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Catherine Masto"
            evntLocation[2] = "495 S Main St, Las Vegas, NV 89101"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Tue, April 18, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Catherine Masto"
            evntLocation[3] = "395 Booth St, Reno, NV 89509"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Sat, April 22, 2017"
            
        }
            //Arizona
        else if (85000 ... 86999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Andy Biggs"
            evntLocation[0] = "25601 S Sun Lakes Blvd, Sun Lakes, AZ 85248"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Fri, April 14, 2017"
            
            eventName[1] = "Coffee"
            evntDescription[1] = "Hosted by Dean Heller "
            evntLocation[1] = "4727 N 7th Ave, Phoenix, AZ 85013"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Wed, April 19, 2017"
            
            eventName[2] = "TownHall"
            evntDescription[2] = "Hosted by Catherine Masto"
            evntLocation[2] = "418 E Main St, Springerville, AZ 85938"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Thu, April 20, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Andy Biggs"
            evntLocation[3] = "25601 S Sun Lakes Blvd, Sun Lakes, AZ 85248"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Fri, April 14, 2017"

        }
            
            //Utah
        else if (84000 ... 84999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Chris Stewart"
            evntLocation[0] = "495 W Center St, Richfield, UT 84701"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Fri, May 12, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Chris Stewart"
            evntLocation[1] = "495 W Center St, Richfield, UT 84701"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Wed, May 17, 2017"
            
            eventName[2] = "Tele-Town Hall"
            evntDescription[2] = "Hosted by Mike Lee"
            evntLocation[2] = "Utah"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Wed, June 14, 2017"
            
            eventName[3] = "Tele-Town Hall"
            evntDescription[3] = "Hosted by Mike Lee"
            evntLocation[3] = "Utah"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Wed, June 14, 2017"
        }
            //Idaho
        else if (83200 ... 83999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Raul Labrador"
            evntLocation[0] = "507 W 8th St, Meridian, ID 83642"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Wed, April 19, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Raul Labrador"
            evntLocation[1] = "495 W Center St, Richfield, UT 84701"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Mon, Apr 24, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Raul Labrador"
            evntLocation[2] = "507 W 8th St, Meridian, ID 83642"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Wed, April 19, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Raul Labrador"
            evntLocation[3] = "Utah"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Mon, April 24, 2017"
        }
            //Wyoming
        else if (82000 ... 83199).contains(postalCode) {
            eventName[0] = "Empty Chair Town Hall"
            evntDescription[0] = "Hosted by John Barrasso"
            evntLocation[0] = "1400 E College Dr, Cheyenne, WY 82007"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Wed, April 19, 2017"
            
            eventName[1] = "Empty Chair Town Hall"
            evntDescription[1] = "Hosted by John Barrasso"
            evntLocation[1] = "1400 E College Dr, Cheyenne, WY 82007"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Wed, April 19, 2017"
            
            eventName[2] = "Empty Chair Town Hall"
            evntDescription[2] = "Hosted by John Barrasso"
            evntLocation[2] = "1400 E College Dr, Cheyenne, WY 82007"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Wed, April 19, 2017"
            
            eventName[3] = "Empty Chair Town Hall"
            evntDescription[3] = "Hosted by John Barrasso"
            evntLocation[3] = "1400 E College Dr, Cheyenne, WY 82007"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Wed, April 19, 2017"
        }
            //Colorado
        else if (80000 ... 81999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Diana DeGette"
            evntLocation[0] = "1144 Broadway, Denver, CO 80203"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Tue, April 18, 2017 "
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Scott Tipton"
            evntLocation[1] = "661 W Capistrano Ave, Pueblo West, CO 81007"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Thu, April 20, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Scott Tipton"
            evntLocation[2] = "661 W Capistrano Ave, Pueblo West, CO 81007"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Thu, April 20, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Jared Polis"
            evntLocation[3] = "170 MacGregor Ave, Estes Park, CO 80517"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Fri, April 21, 2017"
        }
            //New Mexico
        else if (87000 ... 88499).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Tom Udall"
            evntLocation[0] = "680 E University Ave, Las Cruces, NM 88001"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Mon, April 17, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Martin Heinrich "
            evntLocation[1] = "480 E University Ave, Las Cruces, NM 88001"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Mon, April 17, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Martin Heinrich "
            evntLocation[2] = "10800 Dennis Chavez Blvd, Albuquerque, NM 87121"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Wed, April 19, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Janice Schakowsky"
            evntLocation[3] = "111 W Campbell St, Arlington Heights, IL 60005"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Tue, April 18, 2017"
        }
            //Montana
        else if (59000 ... 59999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Tom Udall"
            evntLocation[0] = "680 E University Ave, Las Cruces, NM 88001"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Mon, April 17, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Martin Heinrich "
            evntLocation[1] = "480 E University Ave, Las Cruces, NM 88001"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Mon, April 17, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Martin Heinrich "
            evntLocation[2] = "10800 Dennis Chavez Blvd, Albuquerque, NM 87121"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Wed, April 19, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Janice Schakowsky"
            evntLocation[3] = "111 W Campbell St, Arlington Heights, IL 60005"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Tue, April 18, 2017"
        }
            //North Dakota
        else if (58000 ... 58999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Tom Udall"
            evntLocation[0] = "1305 19th Ave N, Fargo, ND 58102"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Mon, April 17, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Martin Heinrich "
            evntLocation[1] = "701 E Rosser Ave, Bismarck, ND 58501"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Thu, April 20, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Tom Udall"
            evntLocation[2] = "1305 19th Ave N, Fargo, ND 58102"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Mon, April 17, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Martin Heinrich "
            evntLocation[3] = "701 E Rosser Ave, Bismarck, ND 58501"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Thu, April 20, 2017"
        }
            //South Dakota
        else if (57000 ... 57999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Tom Udall"
            evntLocation[0] = "1305 19th Ave N, Fargo, ND 58102"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Mon, April 17, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Martin Heinrich "
            evntLocation[1] = "701 E Rosser Ave, Bismarck, ND 58501"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Thu, April 20, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Tom Udall"
            evntLocation[2] = "1305 19th Ave N, Fargo, ND 58102"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Mon, April 17, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Martin Heinrich "
            evntLocation[3] = "701 E Rosser Ave, Bismarck, ND 58501"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Thu, April 20, 2017"
        }
            //Minnesota
        else if (55000 ... 56799).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Timothy Walz"
            evntLocation[0] = "1920 Lee Blvd, North Mankato, MN 56003"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Mon, April 17, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Timothy Walz"
            evntLocation[1] = "133 West Sanborn (8th) Street, Winona, MN 55987"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Tue, April 18, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Timothy Walz"
            evntLocation[2] = "1920 Lee Blvd, North Mankato, MN 56003"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Mon, April 17, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Timothy Walz"
            evntLocation[3] = "133 West Sanborn (8th) Street, Winona, MN 55987"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Tue, April 18, 2017"

        }
            //Iowa
        else if (50000 ... 52999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Rod Blum at the Cedar Rapids Senior Fair"
            evntLocation[0] = "1100 3rd St SE, Cedar Rapids, IA 52401"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Fri, April 21, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by David Loebsack at The Tap Eater"
            evntLocation[1] = "419 W Wall St, Seymour, IA 52590"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Sat, April 22, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by David Loebsack at North End Grill"
            evntLocation[2] = "203 Weaver Rd, Bloomfield, IA 52537"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Sat, April 22, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by David Loebsack at Morgan's Ice Cream"
            evntLocation[3] = " 303 N 13th St, Centerville, IA 52544"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Sat, April 22, 2017"
        }
            //Wisconson
        else if (50000 ... 52999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Jim Sensenbrenner at the Lake Mills Community Center at 7PM"
            evntLocation[0] = "200 Water St, Lake Mills, WI 53551"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Sun, June 04, 2017 "
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Jim Sensenbrenner at the Brookfield Public Safety Building at 7PM"
            evntLocation[1] = "2100 N Calhoun Rd, Brookfield, WI 53005"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Sun, June 11, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Jim Sensenbrenner at the West Allis Public Library at 7PM"
            evntLocation[2] = "7421 W National Ave, West Allis, WI 53214"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Wed, June 21, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Jim Sensenbrenner at West Bend City Hall at 7PM"
            evntLocation[3] = "1115 S Main St, West Bend, WI 53095"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Sun, June 25, 2017"
        }
            //Nebraska
        else if (68000 ... 69999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Adrian Smith at the Panhandle Research & Extension Center"
            evntLocation[0] = "4502 Ave I, Scottsbluff, NE 69361"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Mon, April 17, 2017 "
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Adrian Smith at the Bremer Community Center"
            evntLocation[1] = "1604 L St, Aurora, NE 68818"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Thu, April 20, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Don Bacon at the Gretna High School Auditorium"
            evntLocation[2] = "11335 S 204th St, Gretna, NE 68028"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Sat, April 29, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Don Bacon at the Millard West High School Auditorium"
            evntLocation[3] = "5710 S 176th Ave, Omaha, NE 68135"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Sat, April 29, 2017"
        }
            //Kansas
        else if (66000 ... 67999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Roger Marshall at the Ellsworth Steak House"
            evntLocation[0] = "1416 Foster Rd, Ellsworth, KS 67439"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Mon, April 17, 2017 "
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Roger Marshall at the Stanton County Senior Center"
            evntLocation[1] = "205 E Weaver Ave, Johnson City, KS 67855"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Tue, April 18, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Roger Marshall at the Bryan Conference Center"
            evntLocation[2] = "416 Main St, Scott City, KS 67871"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Tue, April 18, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Roger Marshall at the Hoisington Activity Center"
            evntLocation[3] = " 1200 Susank Rd, Hoisington, KS 67544"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Sat, April 22, 2017"
        }
            //Missouri
        else if (63000 ... 65999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Claire McCaskill at the Missouri S&T Campus The Havener Center"
            evntLocation[0] = "1346 N Bishop Ave, Rolla, MO 65401"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Fri, Apr 14, 2017 "
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Emanuel Cleaver at the Kansas City Public Library"
            evntLocation[1] = "14 W 10th St, Kansas City, MO 64105"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Sat, April 15, 2017"
            
            eventName[2] = "Empty Chair Town Hall"
            evntDescription[2] = "Located at the Bryan Conference Center"
            evntLocation[2] = "711 N 13th St, St. Louis, MO 63103"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Tue, April 18, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Senator Roy Blunt"
            evntLocation[3] = "8807 Kingston Pike, Knoxville, TN 37923"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Fri, April 21, 2017"
        }
            //Illinois
        else if (60000 ... 62999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Randy Hultgren at the Arcada Theatre"
            evntLocation[0] = "105 E Main St, St Charles, IL 60174"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Tue, Apr 18, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Janice Schakowsky at the Metropolis Performing Arts Centre in Arlington Heights"
            evntLocation[1] = "111 W Campbell St, Arlington Heights, IL 60005"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Tue, Apr 18, 2017"
            
            eventName[2] = "Empty Chair Town Hall"
            evntDescription[2] = "Hosted by John Shimkus at the Carnegie Public Library"
            evntLocation[2] = "712 6th St, Charleston, IL 61920"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Wed, April 19, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Raja Krishnamoorthi at Willowbrook High School"
            evntLocation[3] = "1250 Ardmore Ave, Villa Park, IL 60181"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Sat, April 22, 2017"
        }
            //Oklahoma
        else if (73000 ... 74999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Senator James Lankford at North Block Common"
            evntLocation[0] = "115 N Missouri Ave, Claremore, OK 74017"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Tue, Apr 18, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Senator James Lankford at the Arvest Bank Event Center"
            evntLocation[1] = "4225 SE Adams Rd, Bartlesville, OK 74006"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Thu, Apr 20, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Senator James Lankford at the Midway Grocery & Deli"
            evntLocation[2] = "601 W Eufaula St, Norman, OK 73069"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Fri, April 21, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Senator James Lankford at Willowbrook High School"
            evntLocation[3] = "1400 N Mustang Rd, Mustang, OK 73064"
            evntURL[3] = "https://townhallproject"
            evntDate[3] = "Fri, April 21, 2017"
        }
            //Texas
        else if (75000 ... 79999).contains(postalCode) || (56900 ... 56999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Michael Burgess at Harvest Church "
            evntLocation[0] = "7200 Denton Hwy, Watauga, TX 76148"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Sat, April 22, 2017 "
            
            eventName[1] = "Tele Town Hall"
            evntDescription[1] = "For Southern Counties (Bastrop, Brazos, Burleson, Lee and Travis) at 6:30PM"
            evntLocation[1] = " "
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Thu, Apr 20, 2017"
            
            eventName[2] = "Tele Town Hall"
            evntDescription[2] = "For Northern Counties (Falls, Freestone, Leon, Limestone, McLennan, Milam and Robertson) at 6:30PM "
            evntLocation[2] = " "
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Fri, April 21, 2017"
            
            eventName[3] = "Tele Town Hall"
            evntDescription[3] = "Call-in Radio Town Hall Bryan/College Station - WTAW 1620 AM at 6:30PM"
            evntLocation[3] = " "
            evntURL[3] = "https://townhallproject"
            evntDate[3] = "Fri, April 21, 2017"
        }
            //Liousiana
        else if (70000 ... 71599).contains(postalCode) {
            eventName[0] = "8AM Breakfast with Garret Graves"
            evntDescription[0] = "Grub with Garret - requires RSVP"
            evntLocation[0] = "2200 Pioneer Ave, Cheyenne, WY 82001"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Tue, April 18, 2017"
            
            eventName[1] = "8AM Breakfast with Garret Graves"
            evntDescription[1] = "For Southern Counties (Bastrop, Brazos, Burleson, Lee and Travis) at 6:30PM"
            evntLocation[1] = "Baton Rouge, LA"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Tue, April 18, 2017"
            
            eventName[2] = "8AM Breakfast with Garret Graves"
            evntDescription[2] = "Grub with Garret - requires RSVP"
            evntLocation[2] = "2200 Pioneer Ave, Cheyenne, WY 82001"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Tue, April 18, 2017"
            
            eventName[3] = "8AM Breakfast with Garret Graves"
            evntDescription[3] = "For Southern Counties (Bastrop, Brazos, Burleson, Lee and Travis) at 6:30PM"
            evntLocation[3] = "Baton Rouge, LA"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Tue, April 18, 2017"
        }
            //Arkansas
        else if (71600 ... 72999).contains(postalCode) {
            eventName[0] = "Coffee with Bruce Westerman"
            evntDescription[0] = "Coffee at MooMoo’s Café"
            evntLocation[0] = "120 W Center St, Sheridan, AR 72150"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Wed, April 19, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by French Hill at the Embassy Suites at 2 PM"
            evntLocation[1] = "11301 Financial Centre Pkwy, Little Rock, AR 72211"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Tue, April 18, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Tom Cotton at the Embassy Suites at 2 PM"
            evntLocation[2] = "11301 Financial Centre Pkwy, Little Rock, AR 72211"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Tue, April 18, 2017"
            
            eventName[3] = "Coffee with Bruce Westerman"
            evntDescription[3] = "Coffee at MooMoo’s Café"
            evntLocation[3] = "120 W Center St, Sheridan, AR 72150"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Wed, April 19, 2017"
            
        }
            //Michigan
        else if (48000 ... 49999).contains(postalCode){
            eventName[0] = "Office Hours"
            evntDescription[0] = "Hosted by Daniel Kildee at G’s Pizza at 10:30 AM"
            evntLocation[0] = "5266 South U.S. 23, Oscoda Twp, MI 48750"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Thu, April 20, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Jack Bergman at Bay de Noc Community College at 7 PM"
            evntLocation[1] = "2001 N Lincoln Rd, Escanaba, MI 49829"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Wed, April 19, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Jack Bergman at The Ellison Place at 6:30 PM"
            evntLocation[2] = "Dale Dr, Gaylord, MI 49735"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Thu, April 20, 2017"
            
            eventName[3] = "Town Hal"
            evntDescription[3] = "District-Wide Listening Session Hosted by John Moolenaar"
            evntLocation[3] = "1200 S Franklin St, Mt Pleasant, MI 48858"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Thu, April 20, 2017"

        }
            //Indiana
        else if (46000 ... 47999).contains(postalCode){
            eventName[0] = "Office Hours"
            evntDescription[0] = "Hosted by Daniel Kildee at G’s Pizza at 10:30 AM"
            evntLocation[0] = "5266 South U.S. 23, Oscoda Twp, MI 48750"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Thu, April 20, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Jack Bergman at Bay de Noc Community College at 7 PM"
            evntLocation[1] = "2001 N Lincoln Rd, Escanaba, MI 49829"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Wed, April 19, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Jack Bergman at The Ellison Place at 6:30 PM"
            evntLocation[2] = "Dale Dr, Gaylord, MI 49735"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Thu, April 20, 2017"
            
            eventName[3] = "Town Hal"
            evntDescription[3] = "District-Wide Listening Session Hosted by John Moolenaar"
            evntLocation[3] = "1200 S Franklin St, Mt Pleasant, MI 48858"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Thu, April 20, 2017"
        }
            //Ohio
        else if (43000 ... 45999).contains(postalCode){
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Jim Jordan at the Veterans Memorial Civic and Convention Center at 6 PM"
            evntLocation[0] = "7 Public Square, Lima, OH 45801"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Mon, April 24, 2017"
            
            eventName[1] = "Ticketed Event"
            evntDescription[1] = "Hosted by James Renacci at the S.A.L.T. BOX Ministries at 3 PM"
            evntLocation[1] = "408 Market St W, Canal Fulton, OH 44614"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Wed, April 26, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Jim Jordan at the Veterans Memorial Civic and Convention Center at 6 PM"
            evntLocation[2] = "7 Public Square, Lima, OH 45801"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Mon, April 24, 2017"
            
            eventName[3] = "Ticketed Event"
            evntDescription[3] = "Hosted by James Renacci at the S.A.L.T. BOX Ministries at 3 PM"
            evntLocation[3] = "408 Market St W, Canal Fulton, OH 44614"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Wed, April 26, 2017"

        }
            //Kentucky
        else if (40000 ... 42999).contains(postalCode){
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Thomas Massie at the Children's Home of Northern Kentucky at 11:30 PM"
            evntLocation[0] = "200 Home Rd, Covington, KY 41011"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Fri, April 21, 2017"
            
            eventName[1] = "Ticketed Event"
            evntDescription[1] = "Hosted by James Comer at the Union County Job Corps Center at 4 PM"
            evntLocation[1] = "2302 US-60, Morganfield, KY 42437"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Mon, April 17,  2017"
            
            eventName[2] = "Ticketed Event"
            evntDescription[2] = "Hosted by James Comer at the Hopkins County Fiscal Court Room at 4 PM"
            evntLocation[2] = "56 N Main St, Madisonville, KY 42431"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Tue, April 18,  2017"
            
            eventName[3] = "Ticketed Event"
            evntDescription[3] = "Hosted by James Comer at the Children's Home of Northern Kentucky  at 11:30 AM"
            evntLocation[3] = "200 Home Rd, Covington, KY 41011"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Tue, April 18,  2017"
        }
            //Ten-I-see
        else if (37000 ... 38599).contains(postalCode){
            eventName[0] = "Empty Chair Town Hall"
            evntDescription[0] = "Hosted by Bob Corker at Chattanooga Public Library"
            evntLocation[0] = "1001 Broad St, Chattanooga, TN 37402"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Mon, April 17, 2017 "
            
            eventName[1] = "Office Hours"
            evntDescription[1] = "Hosted By Steve Cohen at Millington Public Library "
            evntLocation[1] = "4858 Navy Rd, Millington, TN 38053"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Fri, Apr 21, 2017"
            
            eventName[2] = "Office Hours"
            evntDescription[2] = "Hosted By Steve Cohen at Gaston Community Center "
            evntLocation[2] = "1040 S 3rd St, Memphis, TN 38106"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Fri, April 21, 2017"
            
            eventName[3] = "Empty Chair Town Hall"
            evntDescription[3] = "Hosted by Bob Corker at Chattanooga Public Library"
            evntLocation[3] = "1001 Broad St, Chattanooga, TN 37402"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Mon, April 17, 2017 "
            
        }
            //Mississippi
        else if (38600 ... 39799).contains(postalCode){
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Bob Corker at Chattanooga Public Library"
            evntLocation[0] = "1001 Broad St, Chattanooga, TN 37402"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Mon, April 17, 2017 "
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted By Steve Cohen at Millington Public Library "
            evntLocation[1] = "4858 Navy Rd, Millington, TN 38053"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Fri, Apr 21, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted By Steve Cohen at Gaston Community Center "
            evntLocation[2] = "1040 S 3rd St, Memphis, TN 38106"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Fri, April 21, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Bob Corker at Chattanooga Public Library"
            evntLocation[3] = "1001 Broad St, Chattanooga, TN 37402"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Mon, April 17, 2017"

        }
            //Alabama
        else if (35000 ... 36999).contains(postalCode){
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Robert Aderholt at Senior Citizen Activity Center"
            evntLocation[0] = "623 Broad St, Gadsden, AL 35901"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Mon, April 24, 2017 "
            
            eventName[1] = "Office Hours"
            evntDescription[1] = "Hosted By Bradley Byrne at Wilmer Senior Citizens Center"
            evntLocation[1] = "13251 Avenue B, Wilmer, AL 36587"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Mon, April 17, 2017 "
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Robert Aderholt at Senior Citizen Activity Center"
            evntLocation[2] = "623 Broad St, Gadsden, AL 35901"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Mon, April 24, 2017 "
            
            eventName[3] = "Office Hours"
            evntDescription[3] = "Hosted By Bradley Byrne at Wilmer Senior Citizens Center"
            evntLocation[3] = "13251 Avenue B, Wilmer, AL 36587"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Mon, April 17, 2017 "
        }
            //Georgia
        else if (30000 ... 31999).contains(postalCode) || (39800 ... 39999).contains(postalCode) {
            eventName[0] = "Ticketed Event"
            evntDescription[0] = "Hosted by Jody Hice at the Dobbins Air Reserve Base at 11 AM"
            evntLocation[0] = "Dobbins Pl SE, Marietta, GA 30069"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Sun, April 19, 2017 "
            
            eventName[1] = "Office Hours"
            evntDescription[1] = "2017 Congressional Art Competition Celebration with Jody Hice at 10 AM"
            evntLocation[1] = "205 S Broad St, Monroe, GA 30655"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Sat, April 29, 2017 "
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Sanford Bishop at the Columbus Public Library (auditorium) at 5:30 PM"
            evntLocation[2] = "3000 Macon Rd, Columbus, GA 31906"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Tue, May 9, 2017 "
            
            eventName[3] = "Office Hours"
            evntDescription[3] = "Visit to Rep. Ferguson's Newnan Office at 10:30 AM"
            evntLocation[3] = "1601 GA-34 b, Newnan, GA 30265"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Wed, April 19, 2017 "

        }
            //Florida
        else if (32000 ... 34999).contains(postalCode){
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Matt Gaetz at the Gulfside Pavilion at 7:30 AM"
            evntLocation[0] = "20 Casino Beach Boardwalk, Pensacola Beach, FL 32561"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Thu, April 20, 2017"
            
            eventName[1] = "Office Hours"
            evntDescription[1] = "Hosted by Brian Mast at the Jensen Beach Community Center at 10 AM"
            evntLocation[1] = "1912 NE Jensen Beach Blvd, Jensen Beach, FL 34957"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Tue, April 25, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Theodore Deutch at the Pride Center at Equality Park"
            evntLocation[2] = "2040 N Dixie Hwy, Wilton Manors, FL 33305"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Fri, April 21, 2017"
            
            eventName[3] = "Speech with a QA"
            evntDescription[3] = "Hosted by Matt Gaetz "
            evntLocation[3] = "701 S J St, Pensacola, FL 32502"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Thu, April 20, 2017"
        }
            //South Carolina
        else if (29000 ... 29999).contains(postalCode){
            eventName[0] = "Office Hours"
            evntDescription[0] = "Hosted by Tom Rice  at the Waccamaw Regional Council of Governments Office at 12 PM"
            evntLocation[0] = "20 Casino Beach Boardwalk, Pensacola Beach, FL 32561"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Wed, April 12, 2017"
            
            eventName[1] = "Empty Chair Town Hall"
            evntDescription[1] = "Hosted by Jeff Duncan at the Littlejohn Community Center at 9 AM"
            evntLocation[1] = "644 Old Greenville Hwy, Clemson, SC 29631"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Sat, April 15, 2017"
            
            eventName[2] = "Office Hours"
            evntDescription[2] = "Hosted by Tom Rice  at the Waccamaw Regional Council of Governments Office at 12 PM"
            evntLocation[2] = "20 Casino Beach Boardwalk, Pensacola Beach, FL 32561"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Wed, April 12, 2017"
            
            eventName[3] = "Empty Chair Town Hall"
            evntDescription[3] = "Hosted by Jeff Duncan at the Littlejohn Community Center at 9 AM"
            evntLocation[3] = "644 Old Greenville Hwy, Clemson, SC 29631"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Sat, April 15, 2017"
        }
            //North Carolina
        else if (27000 ... 28999).contains(postalCode){
            eventName[0] = "Empty Chair Town Hall"
            evntDescription[0] = "Hosted by Mark Meadows  at the Haywood County Courthouse at 3 PM"
            evntLocation[0] = "285 N Main St, Waynesville, NC 28786"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Sun, April 23, 2017"
            
            eventName[1] = "Empty Chair Town Hall"
            evntDescription[1] = "Hosted by Mark Meadows  at the Haywood County Courthouse at 3 PM"
            evntLocation[1] = "285 N Main St, Waynesville, NC 28786"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Sun, April 23, 2017"
            
            eventName[2] = "Empty Chair Town Hall"
            evntDescription[2] = "Hosted by Mark Meadows  at the Haywood County Courthouse at 3 PM"
            evntLocation[2] = "285 N Main St, Waynesville, NC 28786"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Sun, April 23, 2017"
            
            eventName[3] = "Empty Chair Town Hall"
            evntDescription[3] = "Hosted by Mark Meadows  at the Haywood County Courthouse at 3 PM"
            evntLocation[3] = "285 N Main St, Waynesville, NC 28786"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Sun, April 23, 2017"
        }
            //Virginia
        else if (22000 ... 24699).contains(postalCode) || (20100 ... 20199).contains(postalCode) {
            eventName[0] = "Office Hours"
            evntDescription[0] = "Hosted by Bob Goodlatte at the Municipal Building at 3 PM"
            evntLocation[0] = "201 Green St, Bridgewater, VA 22812"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Tue, May 2, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Thomas Garrett  at the Haywood County Courthouse at 7 PM"
            evntLocation[1] = "Moneta"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Tue, May 9, 2017"
            
            eventName[2] = "Office Hours"
            evntDescription[2] = "Hosted by Scott Taylor at the Northampton County Administration building at 3 PM"
            evntLocation[2] = "16404 Courthouse Rd, Cape Charles, VA 23310"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Thu, April 27, 2017"
            
            eventName[3] = "Office Hours"
            evntDescription[3] = "Hosted by Morgan Griffith at the City Council Chambers at 2 PM"
            evntLocation[2] = "618 Virginia Ave NW, Norton, VA 24273"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Thu, April 27, 2017"
        }
            //West Virginia
        else if (24600 ... 26999).contains(postalCode) {
            eventName[0] = "Office Hours"
            evntDescription[0] = "Wednesday Wake Up with Joe at Senator's Charleston Office at 9 AM"
            evntLocation[0] = "900 Pennsylvania Ave, Charleston, WV 25302"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Wed, April 19, 2017"
            
            eventName[1] = "Office Hours"
            evntDescription[1] = "Wednesday Wake Up with Joe at Senator's Charleston Office at 9 AM"
            evntLocation[1] = "900 Pennsylvania Ave, Charleston, WV 25302"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Wed, April 19, 2017"
            
            eventName[2] = "Office Hours"
            evntDescription[2] = "Wednesday Wake Up with Joe at Senator's Charleston Office at 9 AM"
            evntLocation[2] = "900 Pennsylvania Ave, Charleston, WV 25302"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Wed, April 19, 2017"
            
            eventName[3] = "Office Hours"
            evntDescription[3] = "Wednesday Wake Up with Joe at Senator's Charleston Office at 9 AM"
            evntLocation[3] = "900 Pennsylvania Ave, Charleston, WV 25302"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Wed, April 19, 2017"
        }
            //Maryland
        else if (20600 ... 21999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Chris Van Hollen at the Baltimore War Memorial at 7 PM"
            evntLocation[0] = "101 N Gay St, Baltimore, MD 21202"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Thu, April 20, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Dutch Ruppersberger  at the Baltimore War Memorial at 7 PM"
            evntLocation[1] = "101 N Gay St, Baltimore, MD 21202"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Thu, April 20, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Elijah Cummings  at the Baltimore War Memorial at 7 PM"
            evntLocation[2] = "101 N Gay St, Baltimore, MD 21202"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Thu, April 20, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by John Sarbanes at the Baltimore War Memorial at 7 PM"
            evntLocation[3] = "101 N Gay St, Baltimore, MD 21202"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Thu, April 20, 2017"
        }
            //Deleware
        else if (19700 ... 19999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Chris Van Hollen at the Baltimore War Memorial at 7 PM"
            evntLocation[0] = "101 N Gay St, Baltimore, MD 21202"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Thu, April 20, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Dutch Ruppersberger  at the Baltimore War Memorial at 7 PM"
            evntLocation[1] = "101 N Gay St, Baltimore, MD 21202"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Thu, April 20, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Elijah Cummings  at the Baltimore War Memorial at 7 PM"
            evntLocation[2] = "101 N Gay St, Baltimore, MD 21202"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Thu, April 20, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by John Sarbanes at the Baltimore War Memorial at 7 PM"
            evntLocation[3] = "101 N Gay St, Baltimore, MD 21202"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Thu, April 20, 2017"
        }
            //Penn
        else if (19700 ... 19999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Lloyd Smucker at the London Grove Township Building at 7 PM"
            evntLocation[0] = "372 Rosehill Rd #100, West Grove, PA 19390"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Mon, April 24, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Matthew Cartwright   at the Pittston Memorial Libraryat 6:30 PM"
            evntLocation[1] = "47 Broad St, Pittston, PA 18640"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Thu, April 20, 2017"
            
            eventName[2] = "Empty Chair Town Hall"
            evntDescription[2] = "Hosted by Tim Murphy at the Bethel Park Community Center at 6:30 PM"
            evntLocation[2] = "5151 Park Ave, Bethel Park, PA 15102"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Wed, April 19, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Lloyd Smucker at the London Grove Township Building at 7 PM"
            evntLocation[3] = "372 Rosehill Rd #100, West Grove, PA 19390"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Mon, April 24, 2017"
            
        }
            //New Jersey
        else if (19700 ... 19999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Frank LoBiondo at The Inn at the Salem Country Club at 7 PM"
            evntLocation[0] = "91 Salem Country Club Rd, Salem, NJ 08079"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Tue, April 18, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Donald Norcross at the Auditorium at Maple Shade High Schoo at 6:30 PM"
            evntLocation[1] = "180 Frederick Ave, Maple Shade Township, NJ 08052"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Mon, April 17, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Donald Norcross at the The Salvation Army Kroc Center at 6:30 PM"
            evntLocation[2] = "1865 Harrison Ave, Camden, NJ 08105"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Mon, April 24, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Donald Norcross at the The Salvation Army Kroc Center at 6:30 PM"
            evntLocation[3] = "1865 Harrison Ave, Camden, NJ 08105"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Mon, April 24, 2017"
        }

            //New York
        else if (10000 ... 14999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Hosted by Thomas Suozzi at Holy Cross Greek Orthodox Church at 7 PM"
            evntLocation[0] = "11-5 150th St, Whitestone, NY 11357"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Tue, April 18, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by Thomas Suozzi at Samuel Field Y at 7 PM"
            evntLocation[1] = "58-20 Little Neck Pkwy, Flushing, NY 11362"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Wed, April 19, 2017"
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Paul Tonko at Skidmore College (Gannett Auditorium of Palamountain Hall) at 6:30 PM"
            evntLocation[2] = "815 N Broadway, Saratoga Springs, NY 12866"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Thu, April 20, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by Nydia Velazquez at St. Francis College, Founders Hall/Callahan Center at 6 PM"
            evntLocation[3] = "180 Remsen St, Brooklyn, NY 11201"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Mon, April 17, 2017"
        }
            //Massachusetts
        else if (01000 ... 02799).contains(postalCode) {
            eventName[0] = "Ticked Event"
            evntDescription[0] = "Coffee with Congressman Joe Kennedy III at the Coolidge Corner Theatre at 8 AM"
            evntLocation[0] = "290 Harvard St, Brookline, MA 02446"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Fri, June 2, 2017"
            
            eventName[1] = "Speech with a QA"
            evntDescription[1] = "Reflections on the 100th Anniversary of Ireland’s 1916 Easter Rising with Congressman Richard E Neal at 1 PM"
            evntLocation[1] = "21 Edwards St, Springfield, MA 01103"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Mon, April 24 2017 "
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Hosted by Niki Tsongas at the West Middle School Auditorium at 6 PM"
            evntLocation[2] = "70 Shawsheen Rd, Andover, MA 01810"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Tue, April 18 2017"
            
            eventName[3] = "Ticked Event"
            evntDescription[3] = "Coffee with Congressman Joe Kennedy III at the Coolidge Corner Theatre at 8AM"
            evntLocation[3] = "290 Harvard St, Brookline, MA 02446"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Fri, June 2, 2017"
        }
            //Rhode island
        else if (02800 ... 02999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Community Conversation with David Cicilline in Portsmouth Middle School at 3:30 PM"
            evntLocation[0] = "125 Jepson Ln, Portsmouth, RI 02871"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Sat, April 22, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by David Cicilline at Barrington High School at 6:30 PM"
            evntLocation[1] = "220 Lincoln Ave, Barrington, RI 02806"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Wed, April 19, 2017 "
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Community Conversation with David Cicilline in Portsmouth Middle School at 3:30 PM"
            evntLocation[2] = "125 Jepson Ln, Portsmouth, RI 02871"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Sat, April 22, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by David Cicilline at Barrington High School at 6:30 PM"
            evntLocation[3] = "220 Lincoln Ave, Barrington, RI 02806"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Wed, April 19, 2017 "
        }
            //Connect
        else if (06000 ... 06999).contains(postalCode) {
            eventName[0] = "Town Hall"
            evntDescription[0] = "Community Conversation with David Cicilline in Portsmouth Middle School at 3:30 PM"
            evntLocation[0] = "125 Jepson Ln, Portsmouth, RI 02871"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Sat, April 22, 2017"
            
            eventName[1] = "Town Hall"
            evntDescription[1] = "Hosted by David Cicilline at Barrington High School at 6:30 PM"
            evntLocation[1] = "220 Lincoln Ave, Barrington, RI 02806"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Wed, April 19, 2017 "
            
            eventName[2] = "Town Hall"
            evntDescription[2] = "Community Conversation with David Cicilline in Portsmouth Middle School at 3:30 PM"
            evntLocation[2] = "125 Jepson Ln, Portsmouth, RI 02871"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Sat, April 22, 2017"
            
            eventName[3] = "Town Hall"
            evntDescription[3] = "Hosted by David Cicilline at Barrington High School at 6:30 PM"
            evntLocation[3] = "220 Lincoln Ave, Barrington, RI 02806"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Wed, April 19, 2017 "
        }
            //New hamisphere
        else if (05000 ... 05999).contains(postalCode) {
            eventName[0] = "Ticketed Event"
            evntDescription[0] = "Speech from Bernie Sanders at Old Labor Hall at 7 PM"
            evntLocation[0] = "46 Granite St, Barre, VT 05641"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Fri, April 28, 2017"
            
            eventName[1] = "Ticketed Event"
            evntDescription[1] = "Speech from Bernie Sanders at Old Labor Hall at 7 PM"
            evntLocation[1] = "46 Granite St, Barre, VT 05641"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Fri, April 28, 2017"
            
            eventName[2] = "Ticketed Event"
            evntDescription[2] = "Speech from Bernie Sanders at Old Labor Hall at 7 PM"
            evntLocation[2] = "46 Granite St, Barre, VT 05641"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Fri, April 28, 2017"
            
            eventName[3] = "Ticketed Event"
            evntDescription[3] = "Speech from Bernie Sanders at Old Labor Hall at 7 PM"
            evntLocation[3] = "46 Granite St, Barre, VT 05641"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Fri, April 28, 2017"
        }
            //vermont
        else if (03000 ... 03899).contains(postalCode) {
            eventName[0] = "Empty Chair Town Hall"
            evntDescription[0] = "Hosted by Bruce Poliquin at Mount Vernon Community Center at 6:30 PM"
            evntLocation[0] = "2 Main St, Mt Vernon, ME 04352"
            evntURL[0] = "https://townhallproject.com"
            evntDate[0] = "Tue, April 18, 2017"
            
            eventName[1] = "Empty Chair Town Hall"
            evntDescription[1] = "Hosted by Bruce Poliquin at North Dining Hall, University of Maine at Farmington at 6 PM"
            evntLocation[0] = "111 South St, Farmington, ME 04938"
            evntURL[1] = "https://townhallproject.com"
            evntDate[1] = "Mon, April 17, 2017"
            
            eventName[2] = "Empty Chair Town Hall"
            evntDescription[2] = "Hosted by Bruce Poliquin at Mount Vernon Community Center at 6:30 PM"
            evntLocation[2] = "2 Main St, Mt Vernon, ME 04352"
            evntURL[2] = "https://townhallproject.com"
            evntDate[2] = "Tue, April 18, 2017"
            
            eventName[3] = "Empty Chair Town Hall"
            evntDescription[3] = "Hosted by Bruce Poliquin at North Dining Hall, University of Maine at Farmington at 6 PM"
            evntLocation[3] = "111 South St, Farmington, ME 04938"
            evntURL[3] = "https://townhallproject.com"
            evntDate[3] = "Mon, April 17, 2017"
        }

        

    }
    
}
