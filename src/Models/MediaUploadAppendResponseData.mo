import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// MediaUploadAppendResponseData.mo

module {
    public type MediaUploadAppendResponseData = {
        /// Unix epoch time in seconds after when the upload session expires.
        expires_at : ?Int;
    };

    public module JSON {
        public func toCandidValue(value : MediaUploadAppendResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.expires_at) {
                case (?v__) List.add(buf, ("expires_at", #Int(v__)#Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MediaUploadAppendResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let expires_at : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "expires_at")) {
                        case (?expires_at_field) ((switch (expires_at_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null })(switch (expires_at_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        expires_at;
                    };
                };
                case _ null;
            };
    };
};
