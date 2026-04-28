import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// MediaUploadRequestOneShotMedia.mo

module {
    public type MediaUploadRequestOneShotMedia = {
    };

    public module JSON {
        public func toCandidValue(value : MediaUploadRequestOneShotMedia) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MediaUploadRequestOneShotMedia =
            switch (candid) {
                case (#Record(fields)) {
                    ?{
                    };
                };
                case _ null;
            };
    };
};
