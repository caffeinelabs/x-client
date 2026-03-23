
import { type CreateComplianceJobRequestType; JSON = CreateComplianceJobRequestType } "./CreateComplianceJobRequestType";

// CreateComplianceJobRequest.mo
/// A request to create a new batch compliance job.

module {
    // User-facing type: what application code uses
    public type CreateComplianceJobRequest = {
        /// User-provided name for a compliance job.
        name : ?Text;
        /// If true, this endpoint will return a pre-signed URL with resumable uploads enabled.
        resumable : ?Bool;
        type_ : CreateComplianceJobRequestType;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer CreateComplianceJobRequest type
        public type JSON = {
            name : ?Text;
            resumable : ?Bool;
            type_ : CreateComplianceJobRequestType.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : CreateComplianceJobRequest) : JSON = { value with
            type_ = CreateComplianceJobRequestType.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?CreateComplianceJobRequest {
            let ?type_ = CreateComplianceJobRequestType.fromJSON(json.type_) else return null;
            ?{ json with
                type_;
            }
        };
    }
}
