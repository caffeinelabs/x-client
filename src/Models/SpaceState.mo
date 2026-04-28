/// The current state of the Space.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// SpaceState.mo
/// Enum values: #live, #scheduled, #ended

module {
    public type SpaceState = {
        #live;
        #scheduled;
        #ended;
    };

    public module JSON {
        public func toCandidValue(value : SpaceState) : Candid.Candid =
            switch (value) {
                case (#live) #Text("live");
                case (#scheduled) #Text("scheduled");
                case (#ended) #Text("ended");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?SpaceState =
            switch (candid) {
                case (#Text("live")) ?#live;
                case (#Text("scheduled")) ?#scheduled;
                case (#Text("ended")) ?#ended;
                case _ null;
            };

        public func toText(value : SpaceState) : Text =
            switch (value) {
                case (#live) "live";
                case (#scheduled) "scheduled";
                case (#ended) "ended";
            };
    };
};
