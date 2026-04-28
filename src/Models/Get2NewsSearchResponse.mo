
import { type Get2ComplianceJobsResponseMeta; JSON = Get2ComplianceJobsResponseMeta } "./Get2ComplianceJobsResponseMeta";

import { type News; JSON = News } "./News";

import { type Problem; JSON = Problem } "./Problem";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// Get2NewsSearchResponse.mo

module {
    public type Get2NewsSearchResponse = {
        data : ?[News];
        errors : ?[Problem];
        meta : ?Get2ComplianceJobsResponseMeta;
    };

    public module JSON {
        public func toCandidValue(value : Get2NewsSearchResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.data) {
                case (?v__) List.add(buf, ("data", #Array(Array.map<News, Candid.Candid>(v__, News.toCandidValue))));
                case null ();
            };
            switch (value.errors) {
                case (?v__) List.add(buf, ("errors", #Array(Array.map<Problem, Candid.Candid>(v__, Problem.toCandidValue))));
                case null ();
            };
            switch (value.meta) {
                case (?v__) List.add(buf, ("meta", Get2ComplianceJobsResponseMeta.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Get2NewsSearchResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let data : ?[News] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "data")) {
                        case (?data_field) ((switch (data_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<News>();
                            for (c__ in xs__.values()) {
                                let ?m__ = News.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let errors : ?[Problem] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "errors")) {
                        case (?errors_field) ((switch (errors_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Problem>();
                            for (c__ in xs__.values()) {
                                let ?m__ = Problem.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let meta : ?Get2ComplianceJobsResponseMeta = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "meta")) {
                        case (?meta_field) (Get2ComplianceJobsResponseMeta.fromCandidValue(meta_field.1));
                        case null null;
                    };
                    ?{
                        data;
                        errors;
                        meta;
                    };
                };
                case _ null;
            };
    };
};
