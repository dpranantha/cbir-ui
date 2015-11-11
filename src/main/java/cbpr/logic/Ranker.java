package cbpr.logic;

import cbpr.similarity.ImageFeatureExtractor;
import io.atlassian.fugue.Option;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import static cbpr.service.SimpleSimilarityRanker.SimilarityFeature;
import static cbpr.service.SimpleSimilarityRanker.rankAndIndexImagesBasedOnInputtedImage;
import static cbpr.service.SimpleSimilarityRanker.SimilarityCalculator;

public class Ranker {
    private static final String FOLDER = "/src/main/resources";

    protected void doPost(){

    }

    public Map<String, Double> getRanking(final String filePathName, final String imageDbFolder, String similarityFeature) {
        SimilarityFeature feature = SimilarityFeature.TAMURA;
        //could use supplier pattern, but hey it's just a hackathon
        for (SimilarityFeature f : SimilarityFeature.values()) {
            if (f.getDescription().equalsIgnoreCase(similarityFeature)) {
                feature = f;
                break;
            }
        }
        final ArrayList<ImageFeatureExtractor.ImageInImageDatabase> databaseIndex = rankAndIndexImagesBasedOnInputtedImage(filePathName, imageDbFolder,
                        Option.some(feature),
                        Option.some(SimilarityCalculator.ABSOLUTE_DIFF));

        Map<String, Double> results = new HashMap();
        databaseIndex.forEach(index -> {
            if(results.size() <= 10) {
                results.put(index.fileName, index.distanceToSearchImage);
            }
        });
        return results;
    }

    public static void main(String[] args) {
        Ranker ranker= new Ranker();
        Map<String,Double> ranking = ranker.getRanking(FOLDER+"/images/gucci1.jpeg",FOLDER+"/images/search/","tamura");
        ranking.entrySet().forEach(s -> System.out.println(s.getKey() + " distance : " + s.getValue()));
    }

}
