/// Expanded details for the URL specified in the User's profile, with start and end indices.

import { type UrlEntity; JSON = UrlEntity } "./UrlEntity";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UserEntitiesUrl.mo

module {
    public type UserEntitiesUrl = {
        urls : ?[UrlEntity];
    };

    public module JSON {
        public func toCandidValue(value : UserEntitiesUrl) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.urls) {
                case (?v__) List.add(buf, ("urls", #Array(Array.map<UrlEntity, Candid.Candid>(v__, UrlEntity.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserEntitiesUrl =
            switch (candid) {
                case (#Record(fields)) {
                    let urls : ?[UrlEntity] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "urls")) {
                        case (?urls_field) ((switch (urls_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<UrlEntity>();
                            for (c__ in xs__.values()) {
                                let ?m__ = UrlEntity.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        urls;
                    };
                };
                case _ null;
            };
    };
};
