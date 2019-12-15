namespace Infini.AutomaticDivideTool.BusinessLogic.Validation
{
    public class BaseValidation
    {
        public string ItemContent { get; set; }
        public string ItemName { get; set; }
        public string Param { get; set; }
        public bool IsValid { get; set; }
        public string Message { get; set; }
    }
}
