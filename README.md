#mbta-v2
mbta-v2 provides a wrapper for the MBTA-realtime API. The available 0.1 version
should be considered an alpha version. That said, MBTAClient can perform all
requests available via the MBTA-realtime API.

# mbta-v2

mbta-v2 is a wrapper for the MBTA-realtime API, v2. It can perform all requests documented in the MBTA's API, from arrival predictions to alerts.

## Adding to Your Project

If you're using Cocoapods, add the following to your Podfile:

``` ruby
pod 'mbta-v2'
```

The header for mbta-v2 would be included like so:
```objective-c
#import <mbta-v2.h>
```

mbta-v2 requires ARC, and is for iOS only.

### Creating a request for all the routes available at a given stop, parsing results

```objective-c
[[MBTAClient shared] retrieveRoutesByStop:@"70065" withCompletion:^(NSData *data, NSError *error)
{
    NSArray *routes = [MBTAConverter convertRoutesByStop:data];
    for (MBTARoute *route in routes)
        NSLog(@"%@", route.routeID);
}];

```
In this case, for stop id 70065, which is Porter Square, you'd see the following output:

931_

933_

These represent the two Red Line routes that are available at said stop.