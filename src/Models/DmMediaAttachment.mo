import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// DmMediaAttachment.mo

module {
    /// The required-fields slice of DmMediaAttachment — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// The unique identifier of this Media.
        media_id : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express DmMediaAttachment as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type DmMediaAttachment = Required and Optional;

    public module JSON {
        // `init` constructs a DmMediaAttachment from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { DmMediaAttachment.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : DmMediaAttachment {
            let ?res = from_candid(to_candid(required)) : ?DmMediaAttachment else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : DmMediaAttachment) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("media_id", #Text(value.media_id)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?DmMediaAttachment =
            switch (candid) {
                case (#Record(fields)) {
                    let ?media_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_id") else return null;
                    let ?media_id = ((switch (media_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        media_id;
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
