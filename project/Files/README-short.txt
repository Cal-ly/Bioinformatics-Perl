
===========================================================================
gene2pubmed                                     recalculated daily
---------------------------------------------------------------------------
           This file can be considered as the logical equivalent of
           what is reported as Gene/PubMed Links visible in Gene's 
           and PubMed's Links menus. Although gene2pubmed is re-calculated daily,
           some of the source documents (GeneRIFs, for example) are not
           updated that frequently, so timing depends on the update
           frequency of the data source.

           Documentation about how these links are maintained
           is provided here:

           http://www.ncbi.nlm.nih.gov/entrez/query/static/entrezlinks.html#gene

           tab-delimited
           one line per set of tax_id/GeneID/PMID
           Column header line is the first line in the file.
---------------------------------------------------------------------------

tax_id:
           the unique identifier provided by NCBI Taxonomy
           for the species or strain/isolate

GeneID:
           the unique identifier for a gene


PubMed ID (PMID):
           the unique identifier in PubMed for a citation

===========================================================================
gene_info                                       recalculated daily
---------------------------------------------------------------------------
           tab-delimited
           one line per GeneID
           Column header line is the first line in the file.
           Note: subsets of gene_info are available in the DATA/GENE_INFO
                 directory (described later)
---------------------------------------------------------------------------

tax_id:
           the unique identifier provided by NCBI Taxonomy
           for the species or strain/isolate

GeneID:
           the unique identifier for a gene
           ASN1:  geneid

Symbol:
           the default symbol for the gene
           ASN1:  gene->locus

LocusTag:
           the LocusTag value
           ASN1:  gene->locus-tag

Synonyms:
           bar-delimited set of unofficial symbols for the gene

dbXrefs:
           bar-delimited set of identifiers in other databases
           for this gene.  The unit of the set is database:value.

chromosome:
           the chromosome on which this gene is placed.
           for mitochondrial genomes, the value 'MT' is used.

map location:
           the map location for this gene

description:
           a descriptive name for this gene

type of gene:
           the type assigned to the gene according to the list of options
           provided in http://www.ncbi.nlm.nih.gov/IEB/ToolBox/CPP_DOC/lxr/source/src/objects/entrezgene/entrezgene.asn


Symbol from nomenclature authority:
            when not '-', indicates that this symbol is from a
            a nomenclature authority

Full name from nomenclature authority:
            when not '-', indicates that this full name is from a
            a nomenclature authority

Nomenclature status:
            when not '-', indicates the status of the name from the 
            nomenclature authority (O for official, I for interim)

Other designations:
            pipe-delimited set of some alternate descriptions that
            have been assigned to a GeneID
            '-' indicates none is being reported.

Modification date:
            the last date a gene record was updated, in YYYYMMDD format
