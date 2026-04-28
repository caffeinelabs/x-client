/// Metadata about a user's affiliation.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UserAffiliation.mo

module {
    public type UserAffiliation = {
        /// The badge URL corresponding to the affiliation.
        badge_url : ?Text;
        /// The description of the affiliation.
        description : ?Text;
        /// The URL, if available, to details about an affiliation.
        url : ?Text;
        user_id : ?[Text];
    };

    public module JSON {
        public func toCandidValue(value : UserAffiliation) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.badge_url) {
                case (?v__) List.add(buf, ("badge_url", #Text(v__)));
                case null ();
            };
            switch (value.description) {
                case (?v__) List.add(buf, ("description", #Text(v__)));
                case null ();
            };
            switch (value.url) {
                case (?v__) List.add(buf, ("url", #Text(v__)));
                case null ();
            };
            switch (value.user_id) {
                case (?v__) List.add(buf, ("user_id", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UserAffiliation =
            switch (candid) {
                case (#Record(fields)) {
                    let badge_url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "badge_url")) {
                        case (?badge_url_field) ((switch (badge_url_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let description : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "description")) {
                        case (?description_field) ((switch (description_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "url")) {
                        case (?url_field) ((switch (url_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let user_id : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user_id")) {
                        case (?user_id_field) ((switch (user_id_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        badge_url;
                        description;
                        url;
                        user_id;
                    };
                };
                case _ null;
            };
    };
};
