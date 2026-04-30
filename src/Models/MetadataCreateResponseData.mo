
import { type MetadataCreateRequestMetadata; JSON = MetadataCreateRequestMetadata } "./MetadataCreateRequestMetadata";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// MetadataCreateResponseData.mo

module {
    public type MetadataCreateResponseData = {
        associated_metadata : ?MetadataCreateRequestMetadata;
        /// The unique identifier of this Media.
        id : ?Text;
    };

    public module JSON {
        // `init` constructs a MetadataCreateResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { MetadataCreateResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : MetadataCreateResponseData {
            let ?res = from_candid(to_candid(required)) : ?MetadataCreateResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : MetadataCreateResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.associated_metadata) {
                case (?v__) List.add(buf, ("associated_metadata", MetadataCreateRequestMetadata.toCandidValue(v__)));
                case null ();
            };
            switch (value.id) {
                case (?v__) List.add(buf, ("id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MetadataCreateResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let associated_metadata : ?MetadataCreateRequestMetadata = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "associated_metadata")) {
                        case (?associated_metadata_field) (MetadataCreateRequestMetadata.fromCandidValue(associated_metadata_field.1));
                        case null null;
                    };
                    let id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id")) {
                        case (?id_field) ((switch (id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        associated_metadata;
                        id;
                    };
                };
                case _ null;
            };
    };
};
