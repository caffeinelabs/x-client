
import { type PreviewImageMediaKey; JSON = PreviewImageMediaKey } "./PreviewImageMediaKey";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// PreviewImage.mo

module {
    public type PreviewImage = {
        media_key : PreviewImageMediaKey;
    };

    public module JSON {
        // `init` constructs a PreviewImage from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { PreviewImage.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            media_key : PreviewImageMediaKey;
        }) : PreviewImage {
            let ?res = from_candid(to_candid(required)) : ?PreviewImage else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : PreviewImage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("media_key", PreviewImageMediaKey.toCandidValue(value.media_key)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?PreviewImage =
            switch (candid) {
                case (#Record(fields)) {
                    let ?media_key_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_key") else return null;
                    let ?media_key = (PreviewImageMediaKey.fromCandidValue(media_key_field.1)) else return null;
                    ?{
                        media_key;
                    };
                };
                case _ null;
            };
    };
};
