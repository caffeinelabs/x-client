import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// UploadSource.mo

module {
    public type UploadSource = {
        /// Records the source (e.g., app, device) from which the media was uploaded
        upload_source : Text;
    };

    public module JSON {
        // `init` constructs a UploadSource from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { UploadSource.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            upload_source : Text;
        }) : UploadSource {
            let ?res = from_candid(to_candid(required)) : ?UploadSource else Runtime.unreachable();
            res
        };

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
