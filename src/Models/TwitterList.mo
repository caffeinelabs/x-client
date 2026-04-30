/// A X List is a curated group of accounts.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TwitterList.mo

module {
    /// The required-fields slice of TwitterList — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The unique identifier of this List.
        id : Text;
        /// The name of this List.
        name : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express TwitterList as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        created_at : ?Text;
        description : ?Text;
        follower_count : ?Int;
        member_count : ?Int;
        owner_id : ?Text;
        private_ : ?Bool;
    };

    public type TwitterList = Required and Optional;

    public module JSON {
        // `init` constructs a TwitterList from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { TwitterList.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : TwitterList {
            let ?res = from_candid(to_candid(required)) : ?TwitterList else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : TwitterList) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.created_at) {
                case (?v__) List.add(buf, ("created_at", #Text(v__)));
                case null ();
            };
            switch (value.description) {
                case (?v__) List.add(buf, ("description", #Text(v__)));
                case null ();
            };
            switch (value.follower_count) {
                case (?v__) List.add(buf, ("follower_count", #Int(v__)));
                case null ();
            };
            List.add(buf, ("id", #Text(value.id)));
            switch (value.member_count) {
                case (?v__) List.add(buf, ("member_count", #Int(v__)));
                case null ();
            };
            List.add(buf, ("name", #Text(value.name)));
            switch (value.owner_id) {
                case (?v__) List.add(buf, ("owner_id", #Text(v__)));
                case null ();
            };
            switch (value.private_) {
                case (?v__) List.add(buf, ("private", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?TwitterList =
            switch (candid) {
                case (#Record(fields)) {
                    let created_at : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "created_at")) {
                        case (?created_at_field) ((switch (created_at_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let description : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "description")) {
                        case (?description_field) ((switch (description_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let follower_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "follower_count")) {
                        case (?follower_count_field) ((switch (follower_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let member_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "member_count")) {
                        case (?member_count_field) ((switch (member_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let ?name_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name") else return null;
                    let ?name = ((switch (name_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let owner_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "owner_id")) {
                        case (?owner_id_field) ((switch (owner_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let private_ : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "private")) {
                        case (?private__field) ((switch (private__field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        created_at;
                        description;
                        follower_count;
                        id;
                        member_count;
                        name;
                        owner_id;
                        private_;
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
