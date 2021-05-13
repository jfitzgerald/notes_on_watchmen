## Chapter

<table class="collapse ba br2 b--black-10 pv2 ph3">
  <tbody>
    <tr class="striped--light-gray">
      <th class="pv2 ph3 tl f6 fw6 ttu">Attribute</th>
      <th class="pv2 ph3 tl f6 fw6 ttu">Type</th>
      <th class="pv2 ph3 tl f6 fw6 ttu">Example</th>
    </tr>
    <tr>
      <td class="pv2 ph3">chapter_num</td>
      <td class="pv2 ph3"><em>Integer</em></td>
      <td class="pv2 ph3"><code>1</code></td>
    </tr>
    <tr>
      <td class="pv2 ph3">chapter_numeral</td>
      <td class="pv2 ph3"><em>String</em></td>
      <td class="pv2 ph3"><code>Chapter I</code></td>
    </tr>
    <tr>
      <td class="pv2 ph3">title</td>
      <td class="pv2 ph3"><em>String</em></td>
      <td class="pv2 ph3"><code>At midnight, all the agents...</code></td>
    </tr>
    <tr>
      <td class="pv2 ph3">quote</td>
      <td class="pv2 ph3"><em>String</em></td>
      <td class="pv2 ph3"><code>\"At midnight, all the agents and superhuman crew, go out and round up everyone who knows more than they do.\" -- Bob Dylan</code></td>
    </tr>
    <tr>
      <td class="pv2 ph3">doomsday_clock</td>
      <td class="pv2 ph3"><em>String</em></td>
      <td class="pv2 ph3"><code>11:48 PM</code></td>
    </tr>
    <tr>
      <td class="pv2 ph3">pages</td>
      <td class="pv2 ph3"><em>Array of page objects</em></td>
      <td class="pv2 ph3"><code>[ { } ]</code></td>
    </tr>
  </tbody>
</table>

## Page

The default page layout uses 9 panels. Set the `layout` attribute for pages that have a different panel layout (for example, 12).

The cover page should have a page entry with page_num set to 0.

The quote is usually on the last page of the chapter.

The chapter title is usually not on page 1, but a few pages later.

<table class="collapse ba br2 b--black-10 pv2 ph3">
  <tbody>
    <tr class="striped--light-gray">
      <th class="pv2 ph3 tl f6 fw6 ttu">Attribute</th>
      <th class="pv2 ph3 tl f6 fw6 ttu">Type</th>
      <th class="pv2 ph3 tl f6 fw6 ttu">Example</th>
    </tr>
    <tr>
      <td class="pv2 ph3">page_num</td>
      <td class="pv2 ph3"><em>Integer</em></td>
      <td class="pv2 ph3"><code>24</code> (use 0 for the cover page)</td>
    </tr>
    <tr>
      <td class="pv2 ph3">layout</td>
      <td class="pv2 ph3"><em>Integer</em></td>
      <td class="pv2 ph3"><code>12</code> (default is 9)</td>
    </tr>
    <tr>
      <td class="pv2 ph3">panels</td>
      <td class="pv2 ph3"><em>Array of panel objects</em></td>
      <td class="pv2 ph3"><code>[ { } ]</code></td>
    </tr>
  </tbody>
</table>

## Panel

<div class="fl w-60 pa2">
  <p>Panels are numbered based on their top-left position in the page grid, from the top left of the page, reading to the right. For a standard page, the panels are numbered 1-9.</p>
</div>

<div class="fl w-40 pa2">
  <div class="chapter-wrapper tsize-3">
    <table class="page-wrapper ba  b--black-20"><tbody><tr><td>
      <table id="page-01-10" class="panel-grid cols-3">
        <tbody><tr>



          <td id="panel-01-10-01" class=" black-20  w-32"></td>



          <td id="panel-01-10-02" class=" black-20  w-32"></td>



          <td id="panel-01-10-03" class=" black-20  w-32"></td>

        </tr>



        <tr>



          <td id="panel-01-10-04" class=" black-20  w-32"></td>



          <td id="panel-01-10-05" class=" black-20  w-32"></td>



          <td id="panel-01-10-06" class=" black-20  w-32"></td>

        </tr>



        <tr>



          <td id="panel-01-10-07" class=" black-20  w-32"></td>



          <td id="panel-01-10-08" class=" black-20  w-32"></td>



          <td id="panel-01-10-09" class=" black-20  w-32"></td>

        </tr>


      </tbody></table>
    </td></tr></tbody></table>


  </div>
</div>

Example:

```json
{
  "page_num": 10,
  "panels": [
    { "panel": 1 },
    { "panel": 2 },
    { "panel": 3 },
    { "panel": 4 },
    { "panel": 5 },
    { "panel": 6 },
    { "panel": 7 },
    { "panel": 8 },
    { "panel": 9 }
  ]
}
```

<div class="fl w-60 pa2">
  <p>In a 9-panel grid, if the third row appears as a single panel, the panels would be numbered 1-7 and panel 7 would have `width:3`.</p>
</div></p>

<div class="fl w-40 pa2">
  <div class="chapter-wrapper tsize-3">
    <table class="page-wrapper ba  b--black-20"><tbody><tr><td>
      <table id="page-01-03" class="panel-grid cols-3">
        <tbody><tr>
          <td id="panel-01-03-01" class=" black-20  w-32"></td>
          <td id="panel-01-03-02" class=" black-20  w-32"></td>

          <td id="panel-01-03-03" class=" black-20  w-32"></td>

        </tr>



        <tr>



          <td id="panel-01-03-04" class=" black-20  w-32"></td>



          <td id="panel-01-03-05" class=" black-20  w-32"></td>



          <td id="panel-01-03-06" class=" black-20  w-32"></td>

        </tr>



        <tr>



          <td id="panel-01-03-07" colspan="3" class=" black-20  "></td>

        </tr>


      </tbody></table>
    </td></tr></tbody></table>


  </div>
</div>

Example:

```json
{
  "page_num": 10,
  "panels": [
    { "panel": 1 },
    { "panel": 2 },
    { "panel": 3 },
    { "panel": 4 },
    { "panel": 5 },
    { "panel": 6 },
    { "panel": 7, "width": 3 }
  ]
}
```

<div class="fl w-60 pa2">
  <p>In a 9-panel grid, if the first panel in the second row (panel 4) has a width of 2, the next panel would be panel 6.</p>
</div>

<div class="flw-40 pa2">
  <div class="chapter-wrapper tsize-3">





  <table class="page-wrapper ba  b--black-20"><tbody><tr><td>
    <table id="page-01-25" class="panel-grid
    cols-3">


      <tbody><tr>



        <td id="panel-01-25-01" class=" black-20  w-32"></td>



        <td id="panel-01-25-02" class=" black-20  w-32"></td>



        <td id="panel-01-25-03" class=" black-20  w-32"></td>

      </tr>



      <tr>



        <td id="panel-01-25-04" colspan="2" class=" black-20  "></td>



        <td id="panel-01-25-06" class=" black-20  w-32"></td>

      </tr>



      <tr>



        <td id="panel-01-25-07" class=" black-20  w-32"></td>



        <td id="panel-01-25-08" class=" black-20  w-32"></td>



        <td id="panel-01-25-09" class=" black-20  w-32"></td>

      </tr>


    </tbody></table>
  </td></tr></tbody></table>


    </div>
</div>

Example:

```json
{
  "page_num": 10,
  "panels": [
    { "panel": 1 },
    { "panel": 2 },
    { "panel": 3 },
    { "panel": 4, "width": 2 },
    { "panel": 6 },
    { "panel": 7 },
    { "panel": 8 },
    { "panel": 9 }
  ]
}
```

<div class="fl w-60 pa2">
  <p>In a 12-panel grid, if the first panel has a height of 2 (rows) and width of 4 (columns), that page would not have entries for panels 2-8.</p>
</div>

<div class="fl w-40 pa2">
  <div class="chapter-wrapper tsize-3">
    <table class="page-wrapper ba  b--black-20"><tbody><tr><td>
      <table id="page-01-06" class="panel-grid cols-4">


        <tbody><tr>



          <td id="panel-01-06-01" colspan="4" class=" black-20  double "></td>

        </tr>





        <tr>



          <td id="panel-01-06-09" class=" black-20  w-24"></td>



          <td id="panel-01-06-10" class=" black-20  w-24"></td>



          <td id="panel-01-06-11" class=" black-20  w-24"></td>



          <td id="panel-01-06-12" class=" black-20  w-24"></td>

        </tr>


      </tbody></table>
    </td></tr></tbody></table>


  </div>
</div>

Example:

```json
{
  "page_num": 6,
  "layout": 12,
  "panels": [
    { "panel": 1, "width": 4, "height": 2 },
    { "panel": 9 },
    { "panel": 10 },
    { "panel": 11 },
    { "panel": 12 }
  ]
}
```

The panel numbers, width, and height are relative to the page layout.

<table class="collapse ba br2 b--black-10 pv2 ph3">
  <tbody>
    <tr class="striped--light-gray">
      <th class="pv2 ph3 tl f6 fw6 ttu">Attribute</th>
      <th class="pv2 ph3 tl f6 fw6 ttu">Type</th>
      <th class="pv2 ph3 tl f6 fw6 ttu">Example</th>
    </tr>
    <tr>
      <td class="pv2 ph3">panel</td>
      <td class="pv2 ph3"><em>Integer</em></td>
      <td class="pv2 ph3"><code>3</code></td>
    </tr>
    <tr>
      <td class="pv2 ph3">width</td>
      <td class="pv2 ph3"><em>Integer</em></td>
      <td class="pv2 ph3"><code>3</code></td>
    </tr>
    <tr>
      <td class="pv2 ph3">height</td>
      <td class="pv2 ph3"><em>Integer</em></td>
      <td class="pv2 ph3"><code>2</code></td>
    </tr>
    <tr>
      <td class="pv2 ph3">chronology</td>
      <td class="pv2 ph3"><em>String</em></td>
      <td class="pv2 ph3"><code>present | past</code></td>
    </tr>
    <tr>
      <td class="pv2 ph3">rorschachs_journal</td>
      <td class="pv2 ph3"><em>Boolean</em></td>
      <td class="pv2 ph3"><code>true</code></td>
    </tr>
    <tr>
      <td class="pv2 ph3">rorschachs_journal_date</td>
      <td class="pv2 ph3"><em>String</em></td>
      <td class="pv2 ph3"><code>October 12th, 1985</code></td>
    </tr>
    <tr>
      <td class="pv2 ph3">characters</td>
      <td class="pv2 ph3"><em>Array of strings</em></td>
      <td class="pv2 ph3"><code>["dan_dreiberg", "laurie_juspeczyk"]</code></td>
    </tr>
    <tr>
      <td class="pv2 ph3">tags</td>
      <td class="pv2 ph3"><em>Array of strings</em></td>
      <td class="pv2 ph3"><code>["happy_face"]</code></td>
    </tr>
  </tbody>
</table>

### Characters

List each character that appears in the panel. For characters with a real name and a hero name, use the appropriate name.

Available names:

```
the_comedian
edward_blake
rorschach
walter_kovacs
dr_manhattan
jon_osterman
ozymandias
adrian_veidt
nite_owl
dan_dreiberg
silk_spectre
laurie_juspeczyk
```

<div class="w-100 pv2 mr2 now-page-bar">
<div class="flex justify-center bb b--silver">

<a href="/characters/rorschach/" class="link tc pr1">











<div class="ba pa1 mr1 b--black-20">
  <img src="/images/badges/rorschach.png" class="">
</div>


  <span class="marker relative black-90">Rorschach</span>
</a>

<a href="/characters/nite_owl/" class="link tc pr1">










<div class="ba pa1 mr1 b--black-20">
  <img src="/images/badges/nite_owl.png" class="">
</div>


  <span class="marker relative black-90 ">Nite Owl</span>
</a>

<a href="/characters/silk_spectre/" class="link tc pr1">











<div class="ba pa1 mr1 b--black-20">
  <img src="/images/badges/silk_spectre.png" class="">
</div>


  <span class="marker relative black-90">Silk Spectre</span>
</a>

<a href="/characters/dr_manhattan/" class="link tc pr1">











<div class="ba pa1 mr1 b--black-20">
  <img src="/images/badges/dr_manhattan.png" class="">
</div>


  <span class="marker relative black-90">Dr. Manhattan</span>
</a>

<a href="/characters/ozymandias/" class="link tc pr1">











<div class="ba pa1 mr1 b--black-20">
  <img src="/images/badges/ozymandias.png" class="">
</div>


  <span class="marker relative black-90">Ozymandias</span>
</a>

<a href="/characters/the_comedian/" class="link tc pr1">











<div class="ba pa1 mr1 b--black-20">
  <img src="/images/badges/the_comedian.png" class="">
</div>


  <span class="marker relative black-90">The Comedian</span>
</a>

</div>
</div>

### Tags


## Example: Chapter 1

```json
{
  "chapters": [
  {
    "chapter_num": 1
    ,"chapter_numeral": "Chapter I"
    ,"title": "At midnight, all the agents..."
    ,"quote": "\"At midnight, all the agents and superhuman crew, go out and round up everyone who knows more than they do.\" -- Bob Dylan"
    ,"doomsday_clock": "11:48 PM"
    ,"pages": [{"page_num": 0},
    {
      "page_num": 1,
      "panels": [
      {
        "panel": 1,
        "chronology": "present",
        "tags": [
          "happy_face"
        ],
        "notes" : {
          "textual_visual" : "I have seen its true face."
        },
        "rorschachs_journal_date": "October 12th, 1985",
        "rorschachs_journal": true
      },
      {
        "panel": 2,
        "chronology": "present",
        "notes" : {
          "textual_visual": "the gutters are full of blood"
        },
        "rorschachs_journal": true
      },
      {
        "panel": 3,
        "chronology": "present",
        "characters": ["walter_kovacs"],
        "tags": [
          "the_end_is_nigh"
        ],
        "rorschachs_journal": true
      },
      {
        "panel": 4,
        "chronology": "present",
        "characters": ["walter_kovacs"],
        "tags": [
          "pyramid_deliveries"
        ],
        "notes" : {
          "textual_visual": "They could have followed in the footsteps of good men"
        },
        "rorschachs_journal": true
      },
      {
        "panel": 5,
        "chronology": "present",
        "tags": [
          "pyramid_deliveries"
        ],
        "characters": ["walter_kovacs"],
        "rorschachs_journal": true
      },
      {
        "panel": 6,
        "chronology": "present",
        "tags": [
          "pyramid_deliveries"
        ],
        "notes" : {
          "textual_visual": "staring down into the bloody hell"
        },
        "rorschachs_journal": true
      },
      {
        "panel": 7,
        "width": 3,
        "chronology": "present"
      }
    ]
    },
    {
      "page_num": 2,
      "panels": [
      {
        "panel": 1,
        "width": 2,
        "chronology": "present"
      },
      {
        "panel": 3,
        "chronology": "present"
      },
      {
        "panel": 4,
        "chronology": "past",
        "characters": ["edward_blake"]
      },
      {
        "panel": 5,
        "chronology": "present"
      },
      {
        "panel": 6,
        "chronology": "past",
        "tags": [
          "happy_face"
        ],
        "characters": ["edward_blake"]
      },
      {
        "panel": 7,
        "chronology": "present"
      },
      {
        "panel": 8,
        "chronology": "past",
        "tags": [
          "happy_face"
        ],
        "characters": ["edward_blake"]
      },
      {
        "panel": 9,
        "chronology": "present"
      }
    ]
    },
    {
      "page_num": 3,
      "panels": [
      {
        "panel": 1,
        "chronology": "past",
        "tags": [
          "happy_face"
        ],
        "characters": ["edward_blake"]
      },
      {
        "panel": 2,
        "chronology": "present"
      },
      {
        "panel": 3,
        "chronology": "past",
        "tags": [
          "happy_face"
        ],
        "characters": ["edward_blake"]
      },
      {
        "panel": 4,
        "chronology": "present",
        "characters": ["edward_blake"]
      },
      {
        "panel": 5,
        "chronology": "past",
        "tags": [
          "happy_face"
        ],
        "characters": ["edward_blake"]
      },
      {
        "panel": 6,
        "tags": [
          "happy_face"
        ],
        "chronology": "present"
      },
      {
        "panel": 7,
        "width": 3,
        "chronology": "past",
        "tags": [
          "happy_face"
        ],
        "notes" : {
          "textual_visual": "ground floor comin' up"
        },
        "characters": ["edward_blake"]
      }
    ]
    },
    {
      "page_num": 4,
      "panels": [
      {
        "panel": 1
        ,"chronology": "present"
      },
      {
        "panel": 2
        ,"chronology": "past"
        ,"characters": ["edward_blake"]
      },
      {
        "panel": 3
        ,"chronology": "present"
        ,"characters":["bernie"]
        ,"tags": [
          "pirates",
          "black_freighter"
        ]
        ,"notes" : {
          "headline" : "Vietnam 51st State Official!"
        }
      },
      {
        "panel": 4
        ,"chronology": "past"
        ,"characters":["edward_blake"]
        ,"notes" : {
          "textual_visual" : "let this one drop out of sight"
        }
      },
      {
        "panel": 5
        ,"width":2
        ,"chronology": "present"
        ,"tags" : [
          "gunga_diner",
          "knot_tops",
          "the_end_is_nigh",
          "mmeltdowns",
          "blimp"
        ]
      },
      {
        "panel": 7
        ,"chronology": "past"
        ,"notes" : {
          "textual_visual":"his buddies fell outta grace"
        }
      },
      {
        "panel": 8
        ,"characters": ["walter_kovacs"]
        ,"tags" : [
          "clock",
          "pyramid_deliveries"
        ]
        ,"chronology": "present"
      },
      {
        "panel": 9
        ,"characters": ["walter_kovacs"]
        ,"tags" : [
          "the_end_is_nigh"
        ]
        ,"chronology": "present"
      }
      ]
    },
    {
      "page_num": 5,
      "panels": [
        {
          "panel": 1
          ,"tags" : [
            "mmeltdowns",
            "blimp"
          ]
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 2
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 3
          ,"chronology": "present"
          ,"tags" : [
            "happy_face"
          ]
          ,"characters":["rorschach"]
        },
        {
          "panel": 4
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 5
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 6
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 7
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 8
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 9
          ,"chronology": "present"
          ,"characters":["rorschach"]
        }
      ]
    },
    {
      "page_num": 6,
      "layout":12,
      "panels": [
        {
          "panel": 1
          ,"width": 4
          ,"height": 2
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 9
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 10
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 11
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 12
          ,"chronology": "present"
          ,"characters":["rorschach"]
        }
      ]
    },
    {
      "page_num": 7,
      "panels": [
        {
          "panel": 1
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 2
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 3
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 4
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 5
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 6
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 7
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 8
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 9
          ,"chronology": "present"
          ,"characters":["rorschach"]
        }
      ]
    },
    {
      "page_num": 8,
      "panels": [
      {
        "panel": 1
        ,"width": 2
        ,"chronology": "present"
        ,"characters":["rorschach"]
      },
      {
        "panel": 3
        ,"chronology": "present"
        ,"characters":["rorschach"]
      },
      {
        "panel": 4
        ,"chronology": "present"
        ,"characters":["rorschach"]
      },
      {
        "panel": 5
        ,"chronology": "present"
        ,"characters":["rorschach"]
      },
      {
        "panel": 6
        ,"chronology": "present"
        ,"characters":["rorschach"]
      },
      {
        "panel": 7
        ,"chronology": "present"
        ,"characters":["rorschach"]
      },
      {
        "panel": 8
        ,"chronology": "present"
        ,"characters":["rorschach"]
      },
      {
        "panel": 9
        ,"chronology": "present"
        ,"characters":["rorschach"]
      }
      ]
    },
    {
      "page_num": 9,
      "panels": [
        {
          "panel": 1
          ,"chronology": "present"
        },
        {
          "panel": 2
          ,"chronology": "present"
          ,"notes" : {
            "headline" : "Hero Retires - Opens own auto business"
          }
        },
        {
          "panel": 3
          ,"chronology": "present"
          ,"tags":[
            "clock"
          ]
          ,"characters":["dan_dreiberg"]
        },
        {
          "panel": 4
          ,"width": 2
          ,"chronology": "present"
          ,"characters":["dan_dreiberg"]
          ,"tags":[
            "under_the_hood",
            "gladiator"
          ]
        },
        {
          "panel": 6
          ,"chronology": "present"
          ,"characters":["dan_dreiberg"]
        },
        {
          "panel": 7
          ,"chronology": "present"
          ,"characters":["dan_dreiberg"]
          ,"tags":[
            "pale_horse",
            "masons_auto_repairs"
          ]
        },
        {
          "panel": 8
          ,"chronology": "present"
          ,"characters":["dan_dreiberg"]
          ,"tags":[
            "pale_horse",
            "masons_auto_repairs",
            "who_watches"
          ]
        },
        {
          "panel": 9
          ,"chronology": "present"
          ,"characters":["dan_dreiberg"]
          ,"tags":[
            "pale_horse",
            "masons_auto_repairs",
            "gunga_diner"
          ]
          ,"notes":{
            "textual_visual" : "Closed - We Fix'em! - Obsolete models a specialty"
          }
        }
      ]
    },
    {
      "page_num": 10,
      "panels": [
        {
          "panel": 1
          ,"chronology": "present"
          ,"characters": ["dan_dreiberg"]
          ,"tags":[
            "86_buick",
            "knot_top",
            "pale_horse"
          ]
          ,"notes": {
            "headline" : "Russia Protests U.S. Advances in Afghanistan"
          }
        },
        {
          "panel": 2
          ,"chronology": "present"
          ,"characters": ["dan_dreiberg"]
          ,"tags":[
            "treasure_island",
            "nostalgia",
            "pale_horse"
          ]
        },
        {
          "panel": 3
          ,"chronology": "present"
          ,"tags":[
            "blimp"
          ]
          ,"annotations":[
            "The wall plate indicates that D. Dreiberg owns floors 1-4.",
            "The door frame is damaged indicating a break-in."
          ]
          ,"characters": ["dan_dreiberg"]
        },
        {
          "panel": 4
          ,"chronology": "present"
          ,"characters": ["dan_dreiberg"]
        },
        {
          "panel": 5
          ,"chronology": "present"
          ,"characters": ["dan_dreiberg"]
        },
        {
          "panel": 6
          ,"chronology": "present"
          ,"characters": ["dan_dreiberg"]
        },
        {
          "panel": 7
          ,"chronology": "present"
          ,"annotations":[
            "Calendar for Octber 1985 displays Monday-Sunday instead of standard Sunday-Saturday."
          ]
          ,"characters":["dan_dreiberg"]
        },
        {
          "panel": 8
          ,"chronology": "present"
          ,"characters":["dan_dreiberg"]
          ,"annotations":[
              "Can of baked beans from familiar brand, Heinz, which as 58 varieties instead of 57."
          ]
        },
        {
          "panel": 9
          ,"chronology": "present"
          ,"characters":["dan_dreiberg" ,"rorschach"]
        }
      ]
    },
    {
      "page_num": 11,
      "panels": [
      {
        "panel": 1
        ,"chronology": "present"
        ,"characters":["dan_dreiberg" ,"rorschach"]
      },
      {
        "panel": 2
        ,"chronology": "present"
        ,"characters":["dan_dreiberg" ,"rorschach"]
      },
      {
        "panel": 3
        ,"chronology": "present"
        ,"tags":[
          "happy_face"
        ]
        ,"characters":["dan_dreiberg" ,"rorschach"]
      },
      {
        "panel": 4
        ,"chronology": "present"
        ,"tags":[
          "happy_face"
        ]
        ,"characters":["dan_dreiberg" ,"rorschach"]
      },
      {
        "panel": 5
        ,"chronology": "present"
        ,"annotations":[
          "A juxtaposition of Rorschach's blunt delivery of the bad news (the opposite of 'sugar coating') framed with a dispensing of sugar cubes."
        ]
        ,"characters":["dan_dreiberg" ,"rorschach"]
      },
      {
        "panel": 6
        ,"chronology": "present"
        ,"tags":[
          "happy_face"
        ]
        ,"characters":["dan_dreiberg" ,"rorschach"]
      },
      {
        "panel": 7
        ,"chronology": "present"
        ,"characters":["dan_dreiberg" ,"rorschach"]
      },
      {
        "panel": 8
        ,"width":2
        ,"chronology": "present"
        ,"characters":["dan_dreiberg" ,"rorschach"]
      }
    ]
    },
    {
      "page_num": 12,
      "panels": [
      {
        "panel": 1
        ,"chronology": "present"
        ,"characters":["dan_dreiberg" ,"rorschach"]
      },
      {
        "panel": 2
        ,"width":2
        ,"chronology": "present"
        ,"characters":["dan_dreiberg" ,"rorschach"]
      },
      {
        "panel": 4
        ,"chronology": "present"
        ,"characters":["dan_dreiberg" ,"rorschach"]
      },
      {
        "panel": 5
        ,"chronology": "present"
        ,"characters":["dan_dreiberg" ,"rorschach"]
      },
      {
        "panel": 6
        ,"chronology": "present"
        ,"characters":["dan_dreiberg" ,"rorschach"]
      },
      {
        "panel": 7
        ,"width":2
        ,"chronology": "present"
        ,"characters":["dan_dreiberg" ,"rorschach"]
      },
      {
        "panel": 9
        ,"chronology": "present"
        ,"characters":["dan_dreiberg" ,"rorschach"]
      }
    ]
    },
    {
      "page_num": 13,
      "layout":12,
      "panels": [
      {
        "panel": 1
        ,"chronology": "present"
        ,"characters":["dan_dreiberg" ,"rorschach"]
      },
      {
        "panel": 2
        ,"chronology": "present"
        ,"characters":["dan_dreiberg" ,"rorschach"]
      },
      {
        "panel": 3
        ,"chronology": "present"
        ,"characters":["dan_dreiberg" ,"rorschach"]
      },
      {
        "panel": 4
        ,"chronology": "present"
        ,"characters":["dan_dreiberg" ,"rorschach"]
      },
      {
        "panel": 5
        ,"width":4
        ,"height":2
        ,"chronology": "present"
        ,"characters":["dan_dreiberg"]
      }
    ]
    },
    {
      "page_num": 14,
      "panels": [
      {
        "panel": 1,
        "width": 3,
        "chronology": "present",
        "rorschachs_journal_date": "October 13th, 1985",
        "rorschachs_journal": true,
        "characters":["rorschach"]
      },
      {
        "panel": 4,
        "chronology": "present",
        "rorschachs_journal": true,
        "characters":["rorschach"]
      },
      {
        "panel": 5,
        "chronology": "present",
        "rorschachs_journal": true,
        "characters":["rorschach"]
      },
      {
        "panel": 6,
        "chronology": "present",
        "rorschachs_journal": true,
        "characters":["rorschach"]
      },
      {
        "panel": 7,
        "chronology": "present",
        "rorschachs_journal": true,
        "world_building":[
          {
            "context":"place",
            "content":"Happy Harry's"
          },
          {
            "context":"grafiti",
            "content":"Viet Bronx"
          },
          {
            "context":"headline",
            "content":"Congress Approves Lunar Silos"
          }
        ]
      },
      {
        "panel": 8,
        "width": 2,
        "chronology": "present",
        "characters":["rorschach"],
        "rorschachs_journal": true
      }
    ]
    },
    {
      "page_num": 15,
      "panels": [
      {
        "panel": 1,
        "chronology": "present",
        "characters":["rorschach"]
      },
      {
        "panel": 2,
        "chronology": "present",
        "characters": ["rorschach"]
      },
      {
        "panel": 3,
        "chronology": "present",
        "characters": ["rorschach"]
      },
      {
        "panel": 4,
        "chronology": "present",
        "characters": ["rorschach"]
      },
      {
        "panel": 5,
        "chronology": "present",
        "characters": ["rorschach"]
      },
      {
        "panel": 6,
        "chronology": "present",
        "characters": ["rorschach"]
      },
      {
        "panel": 7,
        "chronology": "present",
        "characters": ["rorschach"]
      },
      {
        "panel": 8,
        "chronology": "present",
        "characters": ["rorschach"]
      },
      {
        "panel": 9,
        "chronology": "present",
        "characters": ["rorschach"]
      }
    ]
    },
    {
      "page_num": 16,
      "panels": [
      {
        "panel": 1,
        "chronology": "present",
        "characters": ["rorschach"]
      },
      {
        "panel": 2,
        "chronology": "present",
        "characters":["rorschach"]
      },
      {
        "panel": 3,
        "chronology": "present",
        "characters":["rorschach"]
      },
      {
        "panel": 4,
        "chronology": "present",
        "characters":["rorschach"]
      },
      {
        "panel": 5,
        "chronology": "present"
      },
      {
        "panel": 6,
        "chronology": "present",
        "characters":["rorschach"]
      },
      {
        "panel": 7,
        "chronology": "present"
      },
      {
        "panel": 8,
        "chronology": "present",
        "characters":["rorschach"],
        "rorschachs_journal":true
      },
      {
        "panel": 9,
        "chronology": "present",
        "characters":["rorschach"],
        "rorschachs_journal":true
      }
    ]
    },
    {
      "page_num": 17,
      "panels": [
      {
        "panel": 1,
        "chronology": "present",
        "world_building":[
          {
            "context":"place",
            "content":"Veidt Tower"
          }
        ]
      },
      {
        "panel": 2,
        "width":2,
        "chronology": "present",
        "characters":["rorschach", "adrian_veidt"]
      },
      {
        "panel": 4,
        "chronology": "present",
        "characters":["rorschach", "adrian_veidt"]
      },
      {
        "panel": 5,
        "chronology": "present",
        "characters":["rorschach", "adrian_veidt"]
      },
      {
        "panel": 6,
        "chronology": "present",
        "characters":["rorschach", "adrian_veidt"]
      },
      {
        "panel": 7,
        "chronology": "present",
        "characters": ["adrian_veidt"]
      },
      {
        "panel": 8,
        "chronology": "present",
        "characters":["rorschach", "adrian_veidt"]
      },
      {
        "panel": 9,
        "chronology": "present",
        "characters":["rorschach", "adrian_veidt"]
      }
    ]
    },
    {
      "page_num": 18,
      "panels": [
      {
        "panel": 1,
        "chronology": "present",
        "characters":["rorschach", "adrian_veidt"]
      },
      {
        "panel": 2,
        "chronology": "present",
        "characters":["rorschach", "adrian_veidt"]
      },
      {
        "panel": 3,
        "chronology": "present",
        "characters": ["adrian_veidt"]
      },
      {
        "panel": 4,
        "width": 3,
        "height": 2,
        "chronology": "present",
        "characters": ["adrian_veidt"],
        "world_building":[
          {
            "context":"product",
            "content":"Ozymandias Action Figure"
          },
          {
            "context":"headline",
            "content":"Geneva Talks: U.S. Refuses to Discuss Dr. Manhattan"
          },
          {
            "context":"headline",
            "content":"Nuclear Doomsday Clock Stands at Five to Twelve Warn Experts"
          }
        ]
      }
    ]
    },
    {
      "page_num": 19,
      "panels": [
        {
          "panel": 1
          ,"chronology": "present"
          ,"rorschachs_journal_date": "October 13th, 1985. 8:30 P.M."
          ,"rorschachs_journal": true
          ,"world_building":[
            {
              "context":"place",
              "content":"Rockefeller Military Research Center (Founded 1981)"
            }
          ]
        },
        {
          "panel": 2
          ,"chronology": "present"
          ,"rorschachs_journal": true
          ,"characters":["rorschach"]
        },
        {
          "panel": 3
          ,"chronology": "present"
          ,"rorschachs_journal": true
          ,"characters":["rorschach"]
        },
        {
          "panel": 4
          ,"chronology": "present"
          ,"rorschachs_journal": true
          ,"characters":["rorschach"]
        },
        {
          "panel": 5
          ,"chronology": "present"
          ,"rorschachs_journal": true
          ,"characters":["rorschach"]
          ,"world_building":[
            {
              "context":"place",
              "content":"Special Talent Quarters - Private"
            }
          ]
        },
        {
          "panel": 6
          ,"chronology": "present"
          ,"rorschachs_journal": true
          ,"characters":["rorschach"]
        },
        {
          "panel": 7
          ,"chronology": "present"
          ,"rorschachs_journal": true
          ,"characters":["rorschach"]
        },
        {
          "panel": 8
          ,"chronology": "present"
          ,"rorschachs_journal": true
          ,"characters":["rorschach"]
          ,"world_building":[
            {
              "context":"place",
              "content":"Clearance 2 Only - Keep Out"
            }
          ]
        },
        {
          "panel": 9
          ,"chronology": "present"
          ,"characters":["rorschach"]
        }
      ]
    },
    {
      "page_num": 20,
      "panels": [
        {
          "panel": 1
          ,"width":2
          ,"height":3
          ,"chronology": "present"
          ,"characters":["rorschach" ,"dr_manhattan" ,"laurie_juspeczyk"]
        },
        {
          "panel": 3
          ,"chronology": "present"
          ,"characters":["rorschach" ,"dr_manhattan" ,"laurie_juspeczyk"]
        },
        {
          "panel": 6
          ,"chronology": "present"
          ,"characters":["rorschach" ,"dr_manhattan" ,"laurie_juspeczyk"]
        },
        {
          "panel": 9
          ,"chronology": "present"
          ,"characters":["rorschach" ,"dr_manhattan" ,"laurie_juspeczyk"]
        }
      ]
    },
    {
      "page_num": 21,
      "panels": [
        {
          "panel": 1
          ,"chronology": "present"
          ,"characters":["rorschach" ,"dr_manhattan" ,"laurie_juspeczyk"]
        },
        {
          "panel": 2
          ,"chronology": "present"
          ,"characters":["rorschach" ,"dr_manhattan" ,"laurie_juspeczyk"]
        },
        {
          "panel": 3
          ,"chronology": "present"
          ,"characters": ["dr_manhattan" ,"laurie_juspeczyk"]
        },
        {
          "panel": 4
          ,"chronology": "present"
          ,"characters":["rorschach" ,"dr_manhattan"]
        },
        {
          "panel": 5
          ,"chronology": "present"
          ,"characters":["rorschach" ,"dr_manhattan" ,"laurie_juspeczyk"]
        },
        {
          "panel": 6
          ,"chronology": "present"
          ,"characters":["rorschach" ,"laurie_juspeczyk"]
        },
        {
          "panel": 7
          ,"chronology": "present"
          ,"characters":["rorschach" ,"dr_manhattan" ,"laurie_juspeczyk"]
        },
        {
          "panel": 8
          ,"chronology": "present"
          ,"characters":["rorschach" ,"laurie_juspeczyk"]
        },
        {
          "panel": 9
          ,"chronology": "present"
          ,"characters":["rorschach" ,"dr_manhattan" ,"laurie_juspeczyk"]
        }
      ]
    },
    {
      "page_num": 22,
      "panels": [
        {
          "panel": 1
          ,"chronology": "present"
          ,"characters":["rorschach" ,"dr_manhattan"]
        },
        {
          "panel": 2
          ,"chronology": "present"
          ,"characters":["rorschach" ,"dr_manhattan" ,"laurie_juspeczyk"]
        },
        {
          "panel": 3
          ,"chronology": "present"
          ,"characters": ["dr_manhattan"]
        },
        {
          "panel": 4
          ,"chronology": "present"
          ,"characters":["rorschach" ,"dr_manhattan"]
        },
        {
          "panel": 5
          ,"chronology": "present"
          ,"characters": ["dr_manhattan"]
        },
        {
          "panel": 6
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 7
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 8
          ,"chronology": "present"
          ,"characters":["rorschach"]
        },
        {
          "panel": 9
          ,"chronology": "present"
          ,"characters":["rorschach"]
        }
      ]
    },
    {
      "page_num": 23,
      "panels": [
        {
          "panel": 1
          ,"chronology": "present"
          ,"characters": ["dr_manhattan","laurie_juspeczyk"]
        },
        {
          "panel": 2
          ,"chronology": "present"
          ,"characters": ["dr_manhattan","laurie_juspeczyk"]
        },
        {
          "panel": 3
          ,"chronology": "present"
          ,"characters": ["dr_manhattan" ,"laurie_juspeczyk"]
        },
        {
          "panel": 4
          ,"chronology": "present"
          ,"characters": ["dr_manhattan" ,"laurie_juspeczyk"]
        },
        {
          "panel": 5
          ,"chronology": "present"
          ,"characters": ["dr_manhattan" ,"laurie_juspeczyk"]
        },
        {
          "panel": 6
          ,"chronology": "present"
          ,"characters": ["dr_manhattan" ,"laurie_juspeczyk"]
        },
        {
          "panel": 7
          ,"chronology": "present"
          ,"characters": ["dr_manhattan" ,"laurie_juspeczyk"]
        },
        {
          "panel": 8
          ,"chronology": "present"
          ,"characters": ["dr_manhattan" ,"laurie_juspeczyk"]
        },
        {
          "panel": 9
          ,"chronology": "present"
          ,"characters": ["dr_manhattan" ,"laurie_juspeczyk"]
        }
      ]
    },
    {
      "page_num": 24,
      "panels": [
      {
        "panel": 1,
        "width": 3,
        "chronology": "present",
        "rorschachs_journal_date": "October 13th 1985. 11:30 P.M.",
        "rorschachs_journal": true,
        "characters":["rorschach"],
        "world_building":[
          {
            "context":"grafiti",
            "content":"Krystalnacht"
          },
          {
            "context":"poster",
            "content":"(Partial) Madison Sqaure Garden - Pale Horse"
          },
          {
            "context":"trash",
            "content":"Gunga Diner"
          },
          {
            "context":"grafiti",
            "content":"(Partial) Who Watches the Watchmen"
          }
        ]
      },
      {
        "panel": 4,
        "chronology": "present",
        "rorschachs_journal": true,
        "characters":["rorschach"]
      },
      {
        "panel": 5,
        "chronology": "present",
        "rorschachs_journal": true,
        "characters":["rorschach"]
      },
      {
        "panel": 6,
        "chronology": "present",
        "characters":["rorschach"],
        "rorschachs_journal": true
      },
      {
        "panel": 7,
        "chronology": "present",
        "characters":["rorschach"],
        "rorschachs_journal": true
      },
      {
        "panel": 8,
        "chronology": "present",
        "characters":["rorschach"],
        "rorschachs_journal": true
      },
      {
        "panel": 9,
        "chronology": "present",
        "characters":["rorschach"],
        "rorschachs_journal": true,
        "world_building":[
          {
            "context":"grafiti",
            "content":"Four More Years"
          }
        ]
      }
    ]
    },
    {
      "page_num": 25,
      "panels": [
        {
          "panel": 1
          ,"chronology": "present"
          ,"world_building":[
            {
              "context":"place",
              "content":"Rafael's"
            }
          ]
        },
        {
          "panel": 2
          ,"chronology": "present"
          ,"characters": ["dan_dreiberg" ,"laurie_juspeczyk"]
        },
        {
          "panel": 3
          ,"chronology": "present"
          ,"characters": ["dan_dreiberg" ,"laurie_juspeczyk"]
        },
        {
          "panel": 4
          ,"width": 2
          ,"chronology": "present"
          ,"characters": ["dan_dreiberg" ,"laurie_juspeczyk"]
        },
        {
          "panel": 6
          ,"chronology": "present"
          ,"characters": ["dan_dreiberg" ,"laurie_juspeczyk"]
        },
        {
          "panel": 7
          ,"chronology": "present"
          ,"characters": ["dan_dreiberg" ,"laurie_juspeczyk"]
        },
        {
          "panel": 8
          ,"chronology": "present"
          ,"characters": ["dan_dreiberg" ,"laurie_juspeczyk"]
        },
        {
          "panel": 9
          ,"chronology": "present"
          ,"characters": ["dan_dreiberg" ,"laurie_juspeczyk"]
        }
      ]
    },
    {
      "page_num": 26,
      "panels": [
        {
          "panel": 1
          ,"chronology": "present"
          ,"characters": ["dan_dreiberg" ,"laurie_juspeczyk"]
        },
        {
          "panel": 2
          ,"chronology": "present"
          ,"characters": ["dan_dreiberg" ,"laurie_juspeczyk"]
        },
        {
          "panel": 3
          ,"chronology": "present"
          ,"characters": ["dan_dreiberg" ,"laurie_juspeczyk"]
        },
        {
          "panel": 4
          ,"width": 2
          ,"chronology": "present"
          ,"characters": ["dan_dreiberg" ,"laurie_juspeczyk"]
        },
        {
          "panel": 6
          ,"chronology": "present"
          ,"characters": ["dan_dreiberg" ,"laurie_juspeczyk"]
        },
        {
          "panel": 7
          ,"width": 3
          ,"chronology": "present"
          ,"characters": ["dan_dreiberg" ,"laurie_juspeczyk"]
        }
      ]
    }
    ]
  }
  ]
}
```
