/// Type of connection between users.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UserConnectionStatusInner.mo
/// Enum values: #follow_request_received, #follow_request_sent, #blocking, #followed_by, #following, #muting

module {
    public type UserConnectionStatusInner = {
        #follow_request_received;
        #follow_request_sent;
        #blocking;
        #followed_by;
        #following;
        #muting;
    };

    public module JSON {
        public func toCandidValue(value : UserConnectionStatusInner) : Candid.Candid =
            switch (value) {
                case (#follow_request_received) #Text("follow_request_received");
                case (#follow_request_sent) #Text("follow_request_sent");
                case (#blocking) #Text("blocking");
                case (#followed_by) #Text("followed_by");
                case (#following) #Text("following");
                case (#muting) #Text("muting");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?UserConnectionStatusInner =
            switch (candid) {
                case (#Text("follow_request_received")) ?#follow_request_received;
                case (#Text("follow_request_sent")) ?#follow_request_sent;
                case (#Text("blocking")) ?#blocking;
                case (#Text("followed_by")) ?#followed_by;
                case (#Text("following")) ?#following;
                case (#Text("muting")) ?#muting;
                case _ null;
            };

        public func toText(value : UserConnectionStatusInner) : Text =
            switch (value) {
                case (#follow_request_received) "follow_request_received";
                case (#follow_request_sent) "follow_request_sent";
                case (#blocking) "blocking";
                case (#followed_by) "followed_by";
                case (#following) "following";
                case (#muting) "muting";
            };
    };
};
