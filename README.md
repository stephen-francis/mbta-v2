#mbta-v2
mbta-v2 provides a wrapper for the MBTA-realtime API. The available 0.1 version
should be considered an alpha version. That said, MBTAClient can perform all
requests available via the MBTA-realtime API.

##sample

The header for mbta-v2 would be included like so:
\#import <mbta-v2.h>

The shared MBTAClient can then be used to retrieve data from the MBTA's API:

[[MBTAClient shared] retrieveRoutesByStop:@"70065" withCompletion:^(NSData *data, NSError *error)
{
*NSArray *routes = [MBTAConverter convertRoutesByStop:data];
*for (MBTARoute *route in routes)
**NSLog(@"%@", route.routeID);
}];

}

In this case, for stop id 70065, which is Porter Square, you'd see the following output:

*931_
*933_

These represent the two Red Line routes that are available at said stop.

Some basic information about the MBTA-realtime API, from their documentation:

"MBTA-REALTIME API INTRODUCTION
MBTA-realtime provides RESTful web services to provide data about MBTA services. Data are provided 
in XML, JSON, and JSON-P formats. You will need to register for a free API key to use the API, but you 
can use the open development key (provided in the query examples throughout this document and at 
(http://realtime.mbta.com/Portal/Home/Download)) to start playing with the API right now."

MBTA-realtime API v2 document, covering all aspects of the API:
(http://realtime.mbta.com/Portal/Home/Documents)

"1.1 Use of MBTA data
Access to the MBTA GTFS-realtime feeds is governed by the language in the MassDOT Developers 
License Agreement (http://www.eot.state.ma.us/developers/) in addition to the following conditions:
• The MBTA reserves the right to suspend the data feed, modify the feed, or modify elements of 
the feed at any time at the MBTA's sole and absolute discretion.
• The MBTA does not guarantee any technical support of any kind to users.
• No user may execute polling commands more often than every 10 seconds.  A user that polls 
more often than that or otherwise overtaxes the MBTA's system may be suspended or terminated 
from the data feed."