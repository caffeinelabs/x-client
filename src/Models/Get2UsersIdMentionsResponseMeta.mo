import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Get2UsersIdMentionsResponseMeta.mo

module {
    /// The required-fields slice of Get2UsersIdMentionsResponseMeta — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express Get2UsersIdMentionsResponseMeta as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        newest_id : ?Text;
        next_token : ?Text;
        oldest_id : ?Text;
        previous_token : ?Text;
        result_count : ?Int;
    };

    public type Get2UsersIdMentionsResponseMeta = Required and Optional;

    public module JSON {
        // `init` constructs a Get2UsersIdMentionsResponseMeta from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Get2UsersIdMentionsResponseMeta.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : Get2UsersIdMentionsResponseMeta {
            let ?res = from_candid(to_candid(required)) : ?Get2UsersIdMentionsResponseMeta else Runtime.unreachable();
            res
        };

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

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};
