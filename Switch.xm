#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>

@interface MCProfileConnection : NSObject
+ (MCProfileConnection *)sharedConnection;
- (void)setBoolValue:(BOOL)value forSetting:(NSString *)setting;
- (BOOL)isActivityContinuationAllowed;
@end

extern NSString *MCFeatureActivityContinuationAllowed;

@interface HandoffSwitch : NSObject <FSSwitchDataSource>
@end

@implementation HandoffSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier {
    return [[MCProfileConnection sharedConnection] isActivityContinuationAllowed] ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier {
    if (newState == FSSwitchStateIndeterminate)
        return;
    [[MCProfileConnection sharedConnection] setBoolValue:newState == FSSwitchStateOn forSetting:MCFeatureActivityContinuationAllowed];
}

@end
