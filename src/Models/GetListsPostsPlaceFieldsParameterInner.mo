import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetListsPostsPlaceFieldsParameterInner.mo
/// Enum values: #contained_within, #country, #country_code, #full_name, #geo, #id, #name, #place_type

module {
    public type GetListsPostsPlaceFieldsParameterInner = {
        #contained_within;
        #country;
        #country_code;
        #full_name;
        #geo;
        #id;
        #name;
        #place_type;
    };

    public module JSON {
        public func toCandidValue(value : GetListsPostsPlaceFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#contained_within) #Text("contained_within");
                case (#country) #Text("country");
                case (#country_code) #Text("country_code");
                case (#full_name) #Text("full_name");
                case (#geo) #Text("geo");
                case (#id) #Text("id");
                case (#name) #Text("name");
                case (#place_type) #Text("place_type");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetListsPostsPlaceFieldsParameterInner =
            switch (candid) {
                case (#Text("contained_within")) ?#contained_within;
                case (#Text("country")) ?#country;
                case (#Text("country_code")) ?#country_code;
                case (#Text("full_name")) ?#full_name;
                case (#Text("geo")) ?#geo;
                case (#Text("id")) ?#id;
                case (#Text("name")) ?#name;
                case (#Text("place_type")) ?#place_type;
                case _ null;
            };

        public func toText(value : GetListsPostsPlaceFieldsParameterInner) : Text =
            switch (value) {
                case (#contained_within) "contained_within";
                case (#country) "country";
                case (#country_code) "country_code";
                case (#full_name) "full_name";
                case (#geo) "geo";
                case (#id) "id";
                case (#name) "name";
                case (#place_type) "place_type";
            };
    };
};
