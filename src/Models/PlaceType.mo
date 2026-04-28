import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// PlaceType.mo
/// Enum values: #poi, #neighborhood, #city, #admin, #country, #unknown

module {
    public type PlaceType = {
        #poi;
        #neighborhood;
        #city;
        #admin;
        #country;
        #unknown;
    };

    public module JSON {
        public func toCandidValue(value : PlaceType) : Candid.Candid =
            switch (value) {
                case (#poi) #Text("poi");
                case (#neighborhood) #Text("neighborhood");
                case (#city) #Text("city");
                case (#admin) #Text("admin");
                case (#country) #Text("country");
                case (#unknown) #Text("unknown");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?PlaceType =
            switch (candid) {
                case (#Text("poi")) ?#poi;
                case (#Text("neighborhood")) ?#neighborhood;
                case (#Text("city")) ?#city;
                case (#Text("admin")) ?#admin;
                case (#Text("country")) ?#country;
                case (#Text("unknown")) ?#unknown;
                case _ null;
            };

        public func toText(value : PlaceType) : Text =
            switch (value) {
                case (#poi) "poi";
                case (#neighborhood) "neighborhood";
                case (#city) "city";
                case (#admin) "admin";
                case (#country) "country";
                case (#unknown) "unknown";
            };
    };
};
