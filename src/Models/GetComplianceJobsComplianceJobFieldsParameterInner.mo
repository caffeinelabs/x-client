
// GetComplianceJobsComplianceJobFieldsParameterInner.mo
/// Enum values: #created_at, #download_expires_at, #download_url, #id, #name, #resumable, #status, #type_, #upload_expires_at, #upload_url

module {
    // User-facing type: type-safe variants for application code
    public type GetComplianceJobsComplianceJobFieldsParameterInner = {
        #created_at;
        #download_expires_at;
        #download_url;
        #id;
        #name;
        #resumable;
        #status;
        #type_;
        #upload_expires_at;
        #upload_url;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetComplianceJobsComplianceJobFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetComplianceJobsComplianceJobFieldsParameterInner) : JSON =
            switch (value) {
                case (#created_at) "created_at";
                case (#download_expires_at) "download_expires_at";
                case (#download_url) "download_url";
                case (#id) "id";
                case (#name) "name";
                case (#resumable) "resumable";
                case (#status) "status";
                case (#type_) "type";
                case (#upload_expires_at) "upload_expires_at";
                case (#upload_url) "upload_url";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetComplianceJobsComplianceJobFieldsParameterInner =
            switch (json) {
                case "created_at" ?#created_at;
                case "download_expires_at" ?#download_expires_at;
                case "download_url" ?#download_url;
                case "id" ?#id;
                case "name" ?#name;
                case "resumable" ?#resumable;
                case "status" ?#status;
                case "type" ?#type_;
                case "upload_expires_at" ?#upload_expires_at;
                case "upload_url" ?#upload_url;
                case _ null;
            };
    }
}
