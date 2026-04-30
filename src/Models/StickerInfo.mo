
import { type Sticker; JSON = Sticker } "./Sticker";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// StickerInfo.mo

module {
    public type StickerInfo = {
        /// Stickers list must not be empty and should not exceed 25
        stickers : [Sticker];
    };

    public module JSON {
        // `init` constructs a StickerInfo from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { StickerInfo.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            stickers : [Sticker];
        }) : StickerInfo {
            let ?res = from_candid(to_candid(required)) : ?StickerInfo else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : StickerInfo) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("stickers", #Array(Array.map<Sticker, Candid.Candid>(value.stickers, Sticker.toCandidValue))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?StickerInfo =
            switch (candid) {
                case (#Record(fields)) {
                    let ?stickers_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "stickers") else return null;
                    let ?stickers = ((switch (stickers_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Sticker>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Sticker.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        stickers;
                    };
                };
                case _ null;
            };
    };
};
