
import { type Sticker; JSON = Sticker } "./Sticker";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// StickerInfo.mo

module {
    public type StickerInfo = {
        /// Stickers list must not be empty and should not exceed 25
        stickers : [Sticker];
    };

    public module JSON {
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
