using Infini.AutomaticDivideTool.Utilities;
using System;
using System.Runtime.Serialization;

namespace Infini.AutomaticDivideTool.ExceptionHandler
{
    [Serializable()]
    public class DataAccessException : Exception
    {
        //Logger variable
        private Logger _logger = Logger.GetLogger();

        /// <summary>
        /// Initializes a new instance of the <see cref="DataAccessException"/> class.
        /// </summary>
        /// <param name="message">The message.</param>
        public DataAccessException(string message) : base(message)
        {
            _logger.Error(message);
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="DataAccessException"/> class.
        /// </summary>
        /// <param name="message">The message.</param>
        /// <param name="innerException">The inner exception.</param>
        public DataAccessException(string message, Exception innerException) :
         base(message, innerException)
        {
            _logger.Error(message);
            _logger.Error(innerException);
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="DataAccessException"/> class.
        /// </summary>
        /// <param name="info">The information.</param>
        /// <param name="context">The context.</param>
        protected DataAccessException(SerializationInfo info,
         StreamingContext context) : base(info, context)
        {
            // Implement type-specific serialization constructor logic.
        }
    }
}
