/// Represent the portion of text recognized as a User mention, and its start and end position within the text.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// MentionFields.mo

module {
    public type MentionFields = {
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        id : ?Text;
        /// The X handle (screen name) of this user.
        username : Text;
    };

    public module JSON {
        public func toCandidValue(value : MentionFields) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.id) {
                case (?v__) List.add(buf, ("id", #Text(v__)));
                case null ();
            };
            List.add(buf, ("username", #Text(value.username)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MentionFields =
            switch (candid) {
                case (#Record(fields)) {
                    let id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id")) {
                        case (?id_field) ((switch (id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?username_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "username") else return null;
                    let ?username = ((switch (username_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        id;
                        username;
                    };
                };
                case _ null;
            };
    };
};
