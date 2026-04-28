import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// UploadSource.mo

module {
    public type UploadSource = {
        /// Records the source (e.g., app, device) from which the media was uploaded
        upload_source : Text;
    };

    public module JSON {
        public func toCandidValue(value : UploadSource) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("upload_source", #Text(value.upload_source)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?UploadSource =
            switch (candid) {
                case (#Record(fields)) {
                    let ?upload_source_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "upload_source") else return null;
                    let ?upload_source = ((switch (upload_source_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        upload_source;
                    };
                };
                case _ null;
            };
    };
};
