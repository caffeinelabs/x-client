import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatAddGroupMembersResponse.mo

module {
    /// The required-fields slice of ChatAddGroupMembersResponse — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatAddGroupMembersResponse as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        conversation_key_change_sequence_id : ?Text;
        current_member_ids : ?[Text];
    };

    public type ChatAddGroupMembersResponse = Required and Optional;

    public module JSON {
        // `init` constructs a ChatAddGroupMembersResponse from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatAddGroupMembersResponse.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatAddGroupMembersResponse {
            let ?res = from_candid(to_candid(required)) : ?ChatAddGroupMembersResponse else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatAddGroupMembersResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.conversation_key_change_sequence_id) {
                case (?v__) List.add(buf, ("conversation_key_change_sequence_id", #Text(v__)));
                case null ();
            };
            switch (value.current_member_ids) {
                case (?v__) List.add(buf, ("current_member_ids", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatAddGroupMembersResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let conversation_key_change_sequence_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_key_change_sequence_id")) {
                        case (?conversation_key_change_sequence_id_field) ((switch (conversation_key_change_sequence_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let current_member_ids : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "current_member_ids")) {
                        case (?current_member_ids_field) ((switch (current_member_ids_field.1) {
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
                        conversation_key_change_sequence_id;
                        current_member_ids;
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
