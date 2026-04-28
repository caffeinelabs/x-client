/// A problem that indicates a particular Tweet, User, etc. is not available to you.

import { type DisallowedResourceProblemAllOfResourceType; JSON = DisallowedResourceProblemAllOfResourceType } "./DisallowedResourceProblemAllOfResourceType";

import { type Problem; JSON = Problem } "./Problem";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ResourceUnavailableProblem.mo

module {
    public type ResourceUnavailableProblem = {
        detail : ?Text;
        status : ?Int;
        title : Text;
        type_ : Text;
        parameter : Text;
        resource_id : Text;
        resource_type : DisallowedResourceProblemAllOfResourceType;
    };

    public module JSON {
        public func toCandidValue(value : ResourceUnavailableProblem) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.detail) {
                case (?v__) List.add(buf, ("detail", #Text(v__)));
                case null ();
            };
            switch (value.status) {
                case (?v__) List.add(buf, ("status", #Int(v__)));
                case null ();
            };
            List.add(buf, ("title", #Text(value.title)));
            List.add(buf, ("type", #Text(value.type_)));
            List.add(buf, ("parameter", #Text(value.parameter)));
            List.add(buf, ("resource_id", #Text(value.resource_id)));
            List.add(buf, ("resource_type", DisallowedResourceProblemAllOfResourceType.toCandidValue(value.resource_type)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ResourceUnavailableProblem =
            switch (candid) {
                case (#Record(fields)) {
                    let detail : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "detail")) {
                        case (?detail_field) ((switch (detail_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let status : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "status")) {
                        case (?status_field) ((switch (status_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let ?title_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "title") else return null;
                    let ?title = ((switch (title_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = ((switch (type__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?parameter_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "parameter") else return null;
                    let ?parameter = ((switch (parameter_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?resource_id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "resource_id") else return null;
                    let ?resource_id = ((switch (resource_id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?resource_type_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "resource_type") else return null;
                    let ?resource_type = (DisallowedResourceProblemAllOfResourceType.fromCandidValue(resource_type_field.1)) else return null;
                    ?{
                        detail;
                        status;
                        title;
                        type_;
                        parameter;
                        resource_id;
                        resource_type;
                    };
                };
                case _ null;
            };
    };
};
