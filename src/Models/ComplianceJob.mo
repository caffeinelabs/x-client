
import { type ComplianceJobStatus; JSON = ComplianceJobStatus } "./ComplianceJobStatus";

import { type ComplianceJobType; JSON = ComplianceJobType } "./ComplianceJobType";

// ComplianceJob.mo

module {
    // User-facing type: what application code uses
    public type ComplianceJob = {
        /// Creation time of the compliance job.
        created_at : Text;
        /// Expiration time of the download URL.
        download_expires_at : Text;
        /// URL from which the user will retrieve their compliance results.
        download_url : Text;
        /// Compliance Job ID.
        id : Text;
        /// User-provided name for a compliance job.
        name : ?Text;
        status : ComplianceJobStatus;
        type_ : ComplianceJobType;
        /// Expiration time of the upload URL.
        upload_expires_at : Text;
        /// URL to which the user will upload their Tweet or user IDs.
        upload_url : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ComplianceJob type
        public type JSON = {
            created_at : Text;
            download_expires_at : Text;
            download_url : Text;
            id : Text;
            name : ?Text;
            status : ComplianceJobStatus.JSON;
            type_ : ComplianceJobType.JSON;
            upload_expires_at : Text;
            upload_url : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ComplianceJob) : JSON = { value with
            status = ComplianceJobStatus.toJSON(value.status);
            type_ = ComplianceJobType.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ComplianceJob {
            let ?status = ComplianceJobStatus.fromJSON(json.status) else return null;
            let ?type_ = ComplianceJobType.fromJSON(json.type_) else return null;
            ?{ json with
                status;
                type_;
            }
        };
    }
}
