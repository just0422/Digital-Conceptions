/**
 * Created by stevenliao on 4/12/16.
 */

$(document).ready(function()
{
    // May need to do some manipulation to this part depending on how many pages
    // are shown at once
    // -Steven Liao
    var activePage = $("li.active");
    var prevButton = $("#previous");
    var nextButton = $("#next");

    function enableButton(button)
    {
        button.removeClass("disabled");
        button.addClass("waves-effect");
    }

    function disableButton(button)
    {
        button.removeClass("waves-effect");
        button.addClass("disabled");
    }

    $("#pages").children().each(function(index)
    {
        console.log(index + ": " + $( this ).text());
        $(this).click(function()
        {
            // Change active class depending on which page is clicked so that
            // it will highlight the active page red
            if ($(this).attr("class").indexOf("active") == -1)
            {
                activePage.removeClass("active");
                $(this).addClass("active");
                activePage = $(this);
            }

            // If the active page is page 1, disable the prev button
            if ($(this).first().text() == "1")
            {
                disableButton(prevButton);
                enableButton(nextButton);
            }
            // Otherwise, enable the prev button
            else
            {
                enableButton(prevButton);
            }

            var nextPage = activePage.next("#pages > li");

            // If the active page is last page, disable the next button
            if (nextPage.length == 0)
            {
                disableButton(nextButton);
            }
        })
    })

    prevButton.click(function()
    {
        // If the previous button is not disabled
        if ($(this).attr("class").indexOf("disabled") == -1)
        {
            // Remove active class from active page, and add active class to prev page
            activePage.removeClass("active");
            activePage = activePage.prev();
            activePage.addClass("active");

            var page;
            if (activePage.first().text() == "1")
            {
                disableButton($(this));
                enableButton(nextButton);
            }
        }
    })

    nextButton.click(function()
    {
        if ($(this).attr("class").indexOf("disabled") == -1)
        {
            // Attempt to get the next page
            var nextPage = activePage.next("#pages > li")

            // Remove active class from active page, and add active class to next page
            activePage.removeClass("active");
            activePage = nextPage;
            activePage.addClass("active");

            // If active page is not page 1, enable prev button
            if (activePage.first().text() != "1")
            {
                enableButton(prevButton);
            }

            nextPage = activePage.next("#pages > li");

            // If next page is null, disable next button
            if (nextPage.length == 0)
            {
                disableButton($(this));
            }
        }
    })
})

