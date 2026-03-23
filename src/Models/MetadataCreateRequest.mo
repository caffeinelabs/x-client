
import { type MetadataCreateRequestMetadata; JSON = MetadataCreateRequestMetadata } "./MetadataCreateRequestMetadata";

// MetadataCreateRequest.mo

module {
    // User-facing type: what application code uses
    public type MetadataCreateRequest = {
        /// The unique identifier of this Media.
        id : Text;
        metadata : ?MetadataCreateRequestMetadata;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MetadataCreateRequest type
        public type JSON = {
            id : Text;
            metadata : ?MetadataCreateRequestMetadata.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MetadataCreateRequest) : JSON = { value with
            metadata = do ? { MetadataCreateRequestMetadata.toJSON(value.metadata!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MetadataCreateRequest {
            ?{ json with
                metadata = do ? { MetadataCreateRequestMetadata.fromJSON(json.metadata!)! };
            }
        };
    }
}
