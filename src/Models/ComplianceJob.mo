
import { type ComplianceJobStatus; JSON = ComplianceJobStatus } "./ComplianceJobStatus";

import { type ComplianceJobType; JSON = ComplianceJobType } "./ComplianceJobType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ComplianceJob.mo

module {
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

    public module JSON {
        public func toCandidValue(value : ComplianceJob) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("created_at", #Text(value.created_at)));
            List.add(buf, ("download_expires_at", #Text(value.download_expires_at)));
            List.add(buf, ("download_url", #Text(value.download_url)));
            List.add(buf, ("id", #Text(value.id)));
            switch (value.name) {
                case (?v__) List.add(buf, ("name", #Text(v__)));
                case null ();
            };
            List.add(buf, ("status", ComplianceJobStatus.toCandidValue(value.status)));
            List.add(buf, ("type", ComplianceJobType.toCandidValue(value.type_)));
            List.add(buf, ("upload_expires_at", #Text(value.upload_expires_at)));
            List.add(buf, ("upload_url", #Text(value.upload_url)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ComplianceJob =
            switch (candid) {
                case (#Record(fields)) {
                    let ?created_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "created_at") else return null;
                    let ?created_at = ((switch (created_at_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?download_expires_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "download_expires_at") else return null;
                    let ?download_expires_at = ((switch (download_expires_at_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?download_url_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "download_url") else return null;
                    let ?download_url = ((switch (download_url_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let name : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name")) {
                        case (?name_field) ((switch (name_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?status_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "status") else return null;
                    let ?status = (ComplianceJobStatus.fromCandidValue(status_field.1)) else return null;
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (ComplianceJobType.fromCandidValue(type__field.1)) else return null;
                    let ?upload_expires_at_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "upload_expires_at") else return null;
                    let ?upload_expires_at = ((switch (upload_expires_at_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?upload_url_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "upload_url") else return null;
                    let ?upload_url = ((switch (upload_url_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        created_at;
                        download_expires_at;
                        download_url;
                        id;
                        name;
                        status;
                        type_;
                        upload_expires_at;
                        upload_url;
                    };
                };
                case _ null;
            };
    };
};
