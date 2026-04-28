/// Annotation inferred from the Tweet text.

import { type ContextAnnotationDomainFields; JSON = ContextAnnotationDomainFields } "./ContextAnnotationDomainFields";

import { type ContextAnnotationEntityFields; JSON = ContextAnnotationEntityFields } "./ContextAnnotationEntityFields";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ContextAnnotation.mo

module {
    public type ContextAnnotation = {
        domain : ContextAnnotationDomainFields;
        entity : ContextAnnotationEntityFields;
    };

    public module JSON {
        public func toCandidValue(value : ContextAnnotation) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("domain", ContextAnnotationDomainFields.toCandidValue(value.domain)));
            List.add(buf, ("entity", ContextAnnotationEntityFields.toCandidValue(value.entity)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ContextAnnotation =
            switch (candid) {
                case (#Record(fields)) {
                    let ?domain_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "domain") else return null;
                    let ?domain = (ContextAnnotationDomainFields.fromCandidValue(domain_field.1)) else return null;
                    let ?entity_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "entity") else return null;
                    let ?entity = (ContextAnnotationEntityFields.fromCandidValue(entity_field.1)) else return null;
                    ?{
                        domain;
                        entity;
                    };
                };
                case _ null;
            };
    };
};
