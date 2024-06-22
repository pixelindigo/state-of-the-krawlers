package com.crawljax.examples;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import com.google.common.collect.ImmutableSortedSet;

public class StripDom {

	private final ImmutableSortedSet<String> filterAttributes = ImmutableSortedSet.of("closure_hashcode_(\\w)*", "jquery[0-9]+");

    public StripDom() {}

    /**
     * @param html The html string.
     * @return uniform version of dom with predefined attributes stripped
     */
    public String toUniformDOM(String html) {

        Pattern p = Pattern.compile("<SCRIPT(.*?)</SCRIPT>",
                Pattern.DOTALL | Pattern.CASE_INSENSITIVE);
        Matcher m = p.matcher(html);
        String htmlFormatted = m.replaceAll("");

        p = Pattern.compile("<\\?xml:(.*?)>");
        m = p.matcher(htmlFormatted);
        htmlFormatted = m.replaceAll("");

        htmlFormatted = filterAttributes(htmlFormatted);
        return htmlFormatted;
    }

    /**
     * Filters attributes from the HTML string.
     *
     * @param html The HTML to filter.
     * @return The filtered HTML string.
     */
    public String filterAttributes(String html) {
        String filteredHtml = html;
        for (String attribute : this.filterAttributes) {
            String regex = "\\s" + attribute + "=\"[^\"]*\"";
            Pattern p = Pattern.compile(regex, Pattern.CASE_INSENSITIVE);
            Matcher m = p.matcher(html);
            filteredHtml = m.replaceAll("");
        }
        return filteredHtml;
    }
}
