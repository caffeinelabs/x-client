/// A request to create a new batch compliance job.

import { type CreateComplianceJobRequestType; JSON = CreateComplianceJobRequestType } "./CreateComplianceJobRequestType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateComplianceJobRequest.mo

module {
    public type CreateComplianceJobRequest = {
        /// User-provided name for a compliance job.
        name : ?Text;
        /// If true, this endpoint will return a pre-signed URL with resumable uploads enabled.
        resumable : ?Bool;
        type_ : CreateComplianceJobRequestType;
    };

    public module JSON {
        public func toCandidValue(value : CreateComplianceJobRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.name) {
                case (?v__) List.add(buf, ("name", #Text(v__)));
                case null ();
            };
            switch (value.resumable) {
                case (?v__) List.add(buf, ("resumable", #Bool(v__)));
                case null ();
            };
            List.add(buf, ("type", CreateComplianceJobRequestType.toCandidValue(value.type_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateComplianceJobRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let name : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name")) {
                        case (?name_field) ((switch (name_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let resumable : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "resumable")) {
                        case (?resumable_field) ((switch (resumable_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (CreateComplianceJobRequestType.fromCandidValue(type__field.1)) else return null;
                    ?{
                        name;
                        resumable;
                        type_;
                    };
                };
                case _ null;
            };
    };
};
