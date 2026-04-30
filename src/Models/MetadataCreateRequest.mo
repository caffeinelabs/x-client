
import { type MetadataCreateRequestMetadata; JSON = MetadataCreateRequestMetadata } "./MetadataCreateRequestMetadata";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// MetadataCreateRequest.mo

module {
    public type MetadataCreateRequest = {
        /// The unique identifier of this Media.
        id : Text;
        metadata : ?MetadataCreateRequestMetadata;
    };

    public module JSON {
        // `init` constructs a MetadataCreateRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { MetadataCreateRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
            id : Text;
        }) : MetadataCreateRequest {
            let ?res = from_candid(to_candid(required)) : ?MetadataCreateRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : MetadataCreateRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("id", #Text(value.id)));
            switch (value.metadata) {
                case (?v__) List.add(buf, ("metadata", MetadataCreateRequestMetadata.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MetadataCreateRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let metadata : ?MetadataCreateRequestMetadata = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "metadata")) {
                        case (?metadata_field) (MetadataCreateRequestMetadata.fromCandidValue(metadata_field.1));
                        case null null;
                    };
                    ?{
                        id;
                        metadata;
                    };
                };
                case _ null;
            };
    };
};
