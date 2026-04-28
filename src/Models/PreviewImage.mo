
import { type PreviewImageMediaKey; JSON = PreviewImageMediaKey } "./PreviewImageMediaKey";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// PreviewImage.mo

module {
    public type PreviewImage = {
        media_key : PreviewImageMediaKey;
    };

    public module JSON {
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
