/// A list of metadata found in the User's profile description.

import { type FullTextEntities; JSON = FullTextEntities } "./FullTextEntities";

import { type UserEntitiesUrl; JSON = UserEntitiesUrl } "./UserEntitiesUrl";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UserEntities.mo

module {
    public type UserEntities = {
        description : ?FullTextEntities;
        url : ?UserEntitiesUrl;
    };

    public module JSON {
        public func toCandidValue(value : UserEntities) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.description) {
                case (?v__) List.add(buf, ("description", FullTextEntities.toCandidValue(v__)));
                case null ();
            };
            switch (value.url) {
                case (?v__) List.add(buf, ("url", UserEntitiesUrl.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserEntities =
            switch (candid) {
                case (#Record(fields)) {
                    let description : ?FullTextEntities = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "description")) {
                        case (?description_field) (FullTextEntities.fromCandidValue(description_field.1));
                        case null null;
                    };
                    let url : ?UserEntitiesUrl = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "url")) {
                        case (?url_field) (UserEntitiesUrl.fromCandidValue(url_field.1));
                        case null null;
                    };
                    ?{
                        description;
                        url;
                    };
                };
                case _ null;
            };
    };
};
