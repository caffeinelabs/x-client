
import { type MetadataCreateRequestMetadata; JSON = MetadataCreateRequestMetadata } "./MetadataCreateRequestMetadata";

// MetadataCreateResponseData.mo

module {
    // User-facing type: what application code uses
    public type MetadataCreateResponseData = {
        associated_metadata : ?MetadataCreateRequestMetadata;
        /// The unique identifier of this Media.
        id : ?Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MetadataCreateResponseData type
        public type JSON = {
            associated_metadata : ?MetadataCreateRequestMetadata.JSON;
            id : ?Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MetadataCreateResponseData) : JSON = { value with
            associated_metadata = do ? { MetadataCreateRequestMetadata.toJSON(value.associated_metadata!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MetadataCreateResponseData {
            ?{ json with
                associated_metadata = do ? { MetadataCreateRequestMetadata.fromJSON(json.associated_metadata!)! };
            }
        };
    }
}
