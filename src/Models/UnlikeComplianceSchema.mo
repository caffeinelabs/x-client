
import { type UnlikeComplianceSchemaFavorite; JSON = UnlikeComplianceSchemaFavorite } "./UnlikeComplianceSchemaFavorite";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UnlikeComplianceSchema.mo

module {
    /// The required-fields slice of UnlikeComplianceSchema — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Event time.
        event_at : Text;
        favorite : UnlikeComplianceSchemaFavorite;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express UnlikeComplianceSchema as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type UnlikeComplianceSchema = Required and Optional;

    public module JSON {
        // `init` constructs a UnlikeComplianceSchema from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UnlikeComplianceSchema.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : UnlikeComplianceSchema {
            let ?res = from_candid(to_candid(required)) : ?UnlikeComplianceSchema else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : UnlikeComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("event_at", #Text(value.event_at)));
            List.add(buf, ("favorite", UnlikeComplianceSchemaFavorite.toCandidValue(value.favorite)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UnlikeComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?event_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "event_at") else return null;
                    let ?event_at = ((switch (event_at_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?favorite_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "favorite") else return null;
                    let ?favorite = (UnlikeComplianceSchemaFavorite.fromCandidValue(favorite_field.1)) else return null;
                    ?{
                        event_at;
                        favorite;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};
