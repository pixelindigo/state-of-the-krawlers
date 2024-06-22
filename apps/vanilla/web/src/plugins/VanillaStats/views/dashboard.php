<?php if (!defined('APPLICATION')) exit();

$VanillaID = $this->Data('VanillaID');
$RequestTime = $this->Data('RequestTime');
$SecurityHash = $this->Data('SecurityHash');

function Capitalize($Word) {
   return strtoupper(substr($Word, 0, 1)).substr($Word, 1);
}
function WriteRangeTab($Range, $Sender) {
   echo Wrap(
      Anchor(
         Capitalize($Range),
         'settings?'
         .http_build_query(array('Range' => $Range))
      ),
      'li',
      $Range == $Sender->Range ? array('class' => 'Active') : ''
   )."\n";
}
?>
<h1>Dashboard</h1>
<div class="Tabs DateRangeTabs">
   <input type="text" name="DateRange" class="DateRange DateRangeActive" value="<?php echo Gdn_Format::Date($this->StampStart, T('Date.DefaultFormat')) . ' - ' . Gdn_Format::Date($this->StampEnd, T('Date.DefaultFormat')); ?>" />
   <input type="hidden" name="Range" class="Range" value="<?php echo $this->Range; ?>" />
   <input type="hidden" name="VanillaID" class="VanillaID" value="<?php echo $VanillaID ?>" />
   <input type="hidden" name="SecurityHash" class="SecurityHash" value="<?php echo $SecurityHash; ?>" />
   <input type="hidden" name="RequestTime" class="RequestTime" value="<?php echo $RequestTime; ?>" />
   <ul>
      <?php
      WriteRangeTab(VanillaStatsPlugin::RESOLUTION_DAY, $this);
      WriteRangeTab(VanillaStatsPlugin::RESOLUTION_MONTH, $this);
      ?>
   </ul>
</div>
<div class="Picker"></div>
<script type="text/javascript" src="<?php echo $this->Data('VanillaStatsUrl'); ?>/applications/vanillastats/js/remote.js"></script>
<div class="DashboardSummaries">
   <div class="Loading"></div>
</div>
<script type="text/javascript">
   var GraphPicker = new Picker();
   GraphPicker.Attach({
      'Range': $('div.DateRangeTabs input.DateRange'),
      'Units': '<?php echo $this->Range; ?>',
      'MaxGraduations': 15,
      'MaxPageSize': -1,
      'DateStart': '<?php echo $this->BoundaryStart; ?>',
      'DateEnd': '<?php echo $this->BoundaryEnd; ?>',
      'RangeStart': '<?php echo $this->DateStart; ?>',
      'RangeEnd': '<?php echo $this->DateEnd; ?>' 
   });
</script>
<div class="Column Column1 NewsColumn">
   <h1><?php echo T('Recent News'); ?></h1>
   <div class="List"></div>
</div>
<div class="Column Column2 HelpColumn">
   <h1><?php echo T('Recent Tutorials'); ?></h1>
   <div class="List"></div>
</div>
