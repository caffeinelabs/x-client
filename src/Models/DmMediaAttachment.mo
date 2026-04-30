import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// DmMediaAttachment.mo

module {
    public type DmMediaAttachment = {
        /// The unique identifier of this Media.
        media_id : Text;
    };

    public module JSON {
        // `init` constructs a DmMediaAttachment from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { DmMediaAttachment.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            media_id : Text;
        }) : DmMediaAttachment {
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
};
