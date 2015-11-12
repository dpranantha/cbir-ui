package cbpr.logic;

import io.atlassian.fugue.Option;
import io.atlassian.fugue.Pair;

import java.util.Comparator;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

import static cbpr.service.SimpleSimilarityRanker.*;

public class Ranker {
    private static final String FOLDER = "/src/main/resources";
    private static final int MAX = 10;

    protected void doPost(){

    }

    public TreeMap<String, Double> getRanking(final String filePathName, final String imageDbFolder, String similarityFeature) {
        SimilarityFeature feature = SimilarityFeature.TAMURA;
        //could use supplier pattern, but hey it's just a hackathon
        for (SimilarityFeature f : SimilarityFeature.values()) {
            if (f.getDescription().equalsIgnoreCase(similarityFeature)) {
                feature = f;
                break;
            }
        }

        final Map<String, Double> unsorted = rankAndIndexImagesBasedOnInputtedImage(filePathName, imageDbFolder, Option.some(feature), Option.some(SimilarityCalculator.ABSOLUTE_DIFF))
                .stream()
                .map(s -> new Pair<String, Double>(s.fileName, s.distanceToSearchImage))
                .sorted((a, b) -> Double.compare(a.right(), b.right()))
                .limit(MAX)
                .collect(Collectors.toMap(Pair::left, Pair::right));

        return SortByValue(unsorted);
    }

    private TreeMap<String, Double> SortByValue
            (Map<String, Double> map) {
        ValueComparator vc =  new ValueComparator(map);
        TreeMap<String,Double> sortedMap = new TreeMap<String,Double>(vc);
        sortedMap.putAll(map);
        return sortedMap;
    }

    private class ValueComparator implements Comparator<String> {

        Map<String, Double> map;

        public ValueComparator(Map<String, Double> base) {
            this.map = base;
        }

        public int compare(String a, String b) {
            if (map.get(a) >= map.get(b)) {
                return 1;
            } else {
                return -1;
            } // returning 0 would merge keys
        }
    }

    public static void main(String[] args) {
        Ranker ranker= new Ranker();
        Map<String,Double> ranking = ranker.getRanking(FOLDER+"/images/gucci1.jpeg",FOLDER+"/images/search/","tamura");
        ranking.entrySet().forEach(s -> System.out.println(s.getKey() + " distance : " + s.getValue()));
    }

}
