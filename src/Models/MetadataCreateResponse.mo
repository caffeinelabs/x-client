
import { type MetadataCreateResponseData; JSON = MetadataCreateResponseData } "./MetadataCreateResponseData";

import { type Problem; JSON = Problem } "./Problem";

// MetadataCreateResponse.mo

module {
    // User-facing type: what application code uses
    public type MetadataCreateResponse = {
        data : ?MetadataCreateResponseData;
        errors : ?[Problem];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer MetadataCreateResponse type
        public type JSON = {
            data : ?MetadataCreateResponseData.JSON;
            errors : ?[Problem];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : MetadataCreateResponse) : JSON = { value with
            data = do ? { MetadataCreateResponseData.toJSON(value.data!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?MetadataCreateResponse {
            ?{ json with
                data = do ? { MetadataCreateResponseData.fromJSON(json.data!)! };
            }
        };
    }
}
