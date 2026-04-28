
import { type UnlikeComplianceSchema; JSON = UnlikeComplianceSchema } "./UnlikeComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// LikeComplianceSchema.mo

module {
    public type LikeComplianceSchema = {
        delete : UnlikeComplianceSchema;
    };

    public module JSON {
        public func toCandidValue(value : LikeComplianceSchema) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("delete", UnlikeComplianceSchema.toCandidValue(value.delete)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?LikeComplianceSchema =
            switch (candid) {
                case (#Record(fields)) {
                    let ?delete_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "delete") else return null;
                    let ?delete = (UnlikeComplianceSchema.fromCandidValue(delete_field.1)) else return null;
                    ?{
                        delete;
                    };
                };
                case _ null;
            };
    };
};
