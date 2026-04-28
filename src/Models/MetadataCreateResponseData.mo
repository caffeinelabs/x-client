
import { type MetadataCreateRequestMetadata; JSON = MetadataCreateRequestMetadata } "./MetadataCreateRequestMetadata";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// MetadataCreateResponseData.mo

module {
    public type MetadataCreateResponseData = {
        associated_metadata : ?MetadataCreateRequestMetadata;
        /// The unique identifier of this Media.
        id : ?Text;
    };

    public module JSON {
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
