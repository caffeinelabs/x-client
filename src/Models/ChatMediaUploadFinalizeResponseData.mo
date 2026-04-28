import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatMediaUploadFinalizeResponseData.mo

module {
    public type ChatMediaUploadFinalizeResponseData = {
        /// Whether the finalize request succeeded.
        success : Bool;
    };

    public module JSON {
        public func toCandidValue(value : ChatMediaUploadFinalizeResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("success", #Bool(value.success)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatMediaUploadFinalizeResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let ?success_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "success") else return null;
                    let ?success = ((switch (success_field.1) { case (#Bool(b)) ?b; case _ null })) else return null;
                    ?{
                        success;
                    };
                };
                case _ null;
            };
    };
};
