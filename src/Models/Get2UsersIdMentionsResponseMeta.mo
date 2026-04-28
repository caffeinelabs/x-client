import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// Get2UsersIdMentionsResponseMeta.mo

module {
    public type Get2UsersIdMentionsResponseMeta = {
        /// The newest id in this response.
        newest_id : ?Text;
        /// The next token.
        next_token : ?Text;
        /// The oldest id in this response.
        oldest_id : ?Text;
        /// The previous token.
        previous_token : ?Text;
        /// The number of results returned in this response.
        result_count : ?Int;
    };

    public module JSON {
        public func toCandidValue(value : Get2UsersIdMentionsResponseMeta) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.newest_id) {
                case (?v__) List.add(buf, ("newest_id", #Text(v__)));
                case null ();
            };
            switch (value.next_token) {
                case (?v__) List.add(buf, ("next_token", #Text(v__)));
                case null ();
            };
            switch (value.oldest_id) {
                case (?v__) List.add(buf, ("oldest_id", #Text(v__)));
                case null ();
            };
            switch (value.previous_token) {
                case (?v__) List.add(buf, ("previous_token", #Text(v__)));
                case null ();
            };
            switch (value.result_count) {
                case (?v__) List.add(buf, ("result_count", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Get2UsersIdMentionsResponseMeta =
            switch (candid) {
                case (#Record(fields)) {
                    let newest_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "newest_id")) {
                        case (?newest_id_field) ((switch (newest_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let next_token : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "next_token")) {
                        case (?next_token_field) ((switch (next_token_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let oldest_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "oldest_id")) {
                        case (?oldest_id_field) ((switch (oldest_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let previous_token : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "previous_token")) {
                        case (?previous_token_field) ((switch (previous_token_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let result_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "result_count")) {
                        case (?result_count_field) ((switch (result_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        newest_id;
                        next_token;
                        oldest_id;
                        previous_token;
                        result_count;
                    };
                };
                case _ null;
            };
    };
};
