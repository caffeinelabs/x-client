import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetComplianceJobsComplianceJobFieldsParameterInner.mo
/// Enum values: #created_at, #download_expires_at, #download_url, #id, #name, #resumable, #status, #type_, #upload_expires_at, #upload_url

module {
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

    public module JSON {
        public func toCandidValue(value : GetComplianceJobsComplianceJobFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#created_at) #Text("created_at");
                case (#download_expires_at) #Text("download_expires_at");
                case (#download_url) #Text("download_url");
                case (#id) #Text("id");
                case (#name) #Text("name");
                case (#resumable) #Text("resumable");
                case (#status) #Text("status");
                case (#type_) #Text("type");
                case (#upload_expires_at) #Text("upload_expires_at");
                case (#upload_url) #Text("upload_url");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetComplianceJobsComplianceJobFieldsParameterInner =
            switch (candid) {
                case (#Text("created_at")) ?#created_at;
                case (#Text("download_expires_at")) ?#download_expires_at;
                case (#Text("download_url")) ?#download_url;
                case (#Text("id")) ?#id;
                case (#Text("name")) ?#name;
                case (#Text("resumable")) ?#resumable;
                case (#Text("status")) ?#status;
                case (#Text("type")) ?#type_;
                case (#Text("upload_expires_at")) ?#upload_expires_at;
                case (#Text("upload_url")) ?#upload_url;
                case _ null;
            };

        public func toText(value : GetComplianceJobsComplianceJobFieldsParameterInner) : Text =
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
    };
};
