/// Compliance event.

import { type LikeComplianceSchema; JSON = LikeComplianceSchema } "./LikeComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// LikesComplianceStreamResponseOneOf.mo

module {
    public type LikesComplianceStreamResponseOneOf = {
        data : LikeComplianceSchema;
    };

    public module JSON {
        public func toCandidValue(value : LikesComplianceStreamResponseOneOf) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("data", LikeComplianceSchema.toCandidValue(value.data)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?LikesComplianceStreamResponseOneOf =
            switch (candid) {
                case (#Record(fields)) {
                    let ?data_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data") else return null;
                    let ?data = (LikeComplianceSchema.fromCandidValue(data_field.1)) else return null;
                    ?{
                        data;
                    };
                };
                case _ null;
            };
    };
};
