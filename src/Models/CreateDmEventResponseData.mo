import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateDmEventResponseData.mo

module {
    /// The required-fields slice of CreateDmEventResponseData — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Unique identifier of a DM conversation. This can either be a numeric string, or a pair of numeric strings separated by a '-' character in the case of one-on-one DM Conversations.
        dm_conversation_id : Text;
        /// Unique identifier of a DM Event.
        dm_event_id : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateDmEventResponseData as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type CreateDmEventResponseData = Required and Optional;

    public module JSON {
        // `init` constructs a CreateDmEventResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateDmEventResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateDmEventResponseData {
            let ?res = from_candid(to_candid(required)) : ?CreateDmEventResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateDmEventResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("dm_conversation_id", #Text(value.dm_conversation_id)));
            List.add(buf, ("dm_event_id", #Text(value.dm_event_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateDmEventResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let ?dm_conversation_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "dm_conversation_id") else return null;
                    let ?dm_conversation_id = ((switch (dm_conversation_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?dm_event_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "dm_event_id") else return null;
                    let ?dm_event_id = ((switch (dm_event_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        dm_conversation_id;
                        dm_event_id;
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
